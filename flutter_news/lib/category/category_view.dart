import 'package:flutter/material.dart';
import 'package:flutternews/category/category_list_view.dart';

class CategoryView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoryViewState();
  }
}

class _CategoryViewState extends State<CategoryView> {
  List<String> _categorys = [
    "Coinbase Pro",
    "Bitstamp",
    "Bitfinex",
    "OKEx",
    "Binance",
    "Huobi",
    "LakeBTC",
    "Kraken"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _getItem(context, index);
        },
        itemCount: _categorys.length ~/ 2,
      ),
    );
  }

  Widget _getItem(BuildContext context, int index) {
    return Container(
      child: Row(
        children: <Widget>[
          GestureDetector(
            child: Container(
              child: Center(
                child: Text(
                  _categorys[index * 2],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              width: MediaQuery.of(context).size.width / 2,
              color: index % 2 == 0 ? Colors.orange : Colors.blueAccent,
              height: 130,
            ),
            onTap: () {
              Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
                return CategoryListView("", "");
              }
              ),
              );
            },
          ),
          GestureDetector(
            child: Container(
              child: Center(
                child: Text(
                  _categorys[index * 2 + 1],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              width: MediaQuery.of(context).size.width / 2,
              color: index % 2 != 0 ? Colors.orange : Colors.blueAccent,
              height: 130,
            ),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width / 2,
      height: 130,
    );
  }
}
