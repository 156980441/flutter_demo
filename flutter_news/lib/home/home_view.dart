
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutternews/model/home_model.dart';
import 'package:flutternews/tool/net_manager.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {
  ScrollController _scrollController;
  NetManager _netManager = NetManager();
  List<HomeData> _datalist = List<HomeData>();
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

  Widget _buildSwiper(BuildContext context) {
    return Container(
      child: Swiper(
        pagination: SwiperPagination(),
        control: SwiperControl(),
        autoplay: true,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.orange,
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: Center(
              child: Image.network(
                _datalist[index].image,
                height: 150,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
      height: 150,
      margin: EdgeInsets.only(bottom: 5),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: Image.network(
              _datalist[index].image,
              width: 130,
              height: 110,
              fit: BoxFit.cover,
            ),
            color: Colors.grey,
          ),
          Column(
            children: <Widget>[
              Container(
                child: Text(
                  _datalist[index].title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                width: MediaQuery.of(context).size.width - 130 - 20,
              ),
              Container(
                child: Text(_datalist[index].title),
                margin: EdgeInsets.only(left: 10, top: 5),
              ),
              Container(
                child: Text(_datalist[index].passtime),
                margin: EdgeInsets.only(left: 10, top: 5),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ],
      ),
      height: 110,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 1),
      color: Colors.amber,
    );
  }

  Future<Null> _onRefresh() async {
    _currentPage = 1;
    await _requestData(_currentPage);
  }

  Future _requestData(int page) async {
    HomeModel data = await _netManager.queryHomeData(page);
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

  int _getItemCount () {
    if (_datalist != null && _datalist.length > 3) {
      return _datalist.length - 3 + 1;
    }
    else {
      return 0;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return _buildSwiper(context);
              } else {
                return _buildItem(context, index);
              }
            },
            itemCount: _getItemCount(),
            controller: _scrollController,
          ),
          onRefresh: _onRefresh),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
    );
  }
}
