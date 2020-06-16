import 'package:flutter/material.dart';
import 'package:flutternews/category/category_view.dart';
import 'package:flutternews/home/home_view.dart';
import 'package:flutternews/order/order_view.dart';
import 'package:flutternews/depth/depth_view.dart';
import 'package:flutternews/trade/limit/limit_view.dart';
import 'package:flutternews/trade/composed_trade_view.dart';
//import 'package:flutter/rendering.dart';

void main() {
//  debugPaintSizeEnabled=true;
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _containerView();
  }

  Widget _containerView() {
    final List<Tab> list = [
      Tab(
        child: Text("自选", style: TextStyle(color: Colors.black)),
      ),
      Tab(
        child: Text("币币", style: TextStyle(color: Colors.black)),
      ),
      Tab(
        child: Text("订单", style: TextStyle(color: Colors.black)),
      ),
      Tab(
        child: Text("深度", style: TextStyle(color: Colors.black)),
      ),
      Tab(
        child: Text("限价", style: TextStyle(color: Colors.black)),
      ),
      Tab(
        child: Text("杠杆", style: TextStyle(color: Colors.black)),
      ),
    ];
    return DefaultTabController(
      length: list.length,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: list,
              indicatorColor: Colors.green,
            ),
            title: Text(
              "Global",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
          ),
          body: TabBarView(children: [
            HomeView(),
            CategoryView(),
            OrderView(),
            DepthView(),
            LimitView(),
            ComposedTradeView(),
          ]),
        ),
      ),
    );
  }
}
