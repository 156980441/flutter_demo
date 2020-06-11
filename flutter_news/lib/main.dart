import 'package:flutter/material.dart';
import 'package:flutternews/category/category_view.dart';
import 'package:flutternews/home/home_view.dart';
import 'package:flutternews/order/order_view.dart';
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
    return DefaultTabController(
        length: 3,
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(
                    child: Text("自选", style: TextStyle(color: Colors.black)),
                  ),
                  Tab(
                    child: Text("币币", style: TextStyle(color: Colors.black)),
                  ),
                  Tab(
                    child: Text("订单", style: TextStyle(color: Colors.black)),
                  )
                ],
                indicatorColor: Colors.green,),
              title: Text("Global", style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
            ),
            body: TabBarView(children: [HomeView(), CategoryView(), OrderView()]),
          ),
        ),
    );
  }
}
