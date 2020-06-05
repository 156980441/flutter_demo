import 'package:flutter/material.dart';
import 'package:flutternews/tool/net_manager.dart';
import 'package:flutternews/model/currency.dart';

class CategoryListView extends StatefulWidget {
  String title;
  String path;
  CategoryListView(this.title, this.path);
  @override
  State<StatefulWidget> createState() {
    return _CategoryListViewState("", "");
  }
}


class _CategoryListViewState extends State<CategoryListView> {
  String title;
  String path;
  ScrollController _scrollController;
  NetManager _netManager = NetManager();
  List<CurrencyData> _datalist = List<CurrencyData>();
  _CategoryListViewState(this.title, this.path);

  int _currentPage = 1;
  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          _requestData(_currentPage);
        }
      });

    _requestData(_currentPage);
  }

  @override
  Widget build(BuildContext context) {
    AppBar _appbar = AppBar(title: Text(title));
    return Scaffold(
      appBar: _appbar,
      body: Container(
        child: RefreshIndicator(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {

                  return _buildItem(context, index);
              },
              itemCount: this._datalist.length,
              controller: _scrollController,
            ),
            onRefresh: _onRefresh),
        height: MediaQuery.of(context).size.height - _appbar.preferredSize.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: Text(
                  _datalist[index].id,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                width: MediaQuery.of(context).size.width - 20,
              ),
              Container(
                child: Text(_datalist[index].name),
                margin: EdgeInsets.only(left: 10, top: 5),
                width: MediaQuery.of(context).size.width  - 20,
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 1),
    );
  }

  Future<Null> _onRefresh() async {
    _currentPage = 1;
    await _requestData(_currentPage);
  }

  Future _requestData(int page) async {
    CurrencyModel data = await _netManager.queryCurrencyData();
    if (page == 1) {
      _datalist.clear();
      _datalist.addAll(data.result);
    } else {
      _datalist.addAll(data.result);
    }
    _currentPage++;
    this.setState((){});
    return;
  }
}