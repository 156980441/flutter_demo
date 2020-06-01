import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
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
          } else {
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
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
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
        },
        itemCount: 10,
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
    );
  }
}
