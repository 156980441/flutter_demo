import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
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
  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          print("the end");
        }
      });

//    _requestData(1);
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
            height: 100,
            child: Center(
              child: Text(
                "Digit Currency",
                style: TextStyle(fontSize: 50),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
      height: 150,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: Image.network(
              "",
              width: 130,
              height: 110,
            ),
            color: Colors.grey,
          ),
          Column(
            children: <Widget>[
              Container(
                child: Text(
                  "BTC",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                width: MediaQuery.of(context).size.width - 130 - 20,
              ),
              Container(
                child: Text("ETH"),
                margin: EdgeInsets.only(left: 10, top: 5),
              ),
              Container(
                child: Text("EOS"),
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
    await Future.delayed(Duration(seconds: 3), () {
      print("pull down loading");
    });
  }

  void _requestData(int page) async {
    String data = await _netManager.queryHomeData(page);
    print(data);
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
            itemCount: 10,
            controller: _scrollController,
          ),
          onRefresh: _onRefresh),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
    );
  }
}
