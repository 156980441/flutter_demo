import 'package:flutter/material.dart';
import 'package:flutternews/category/category_view.dart';
import './home/home_view.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _containerView();
  }

  Widget _containerView() {
    return DefaultTabController(
        length: 2,
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(
                    child: Text("OKEx", style: TextStyle(color: Colors.black)),
                  ),
                  Tab(
                    child: Text("Huobi", style: TextStyle(color: Colors.black)),
                  )
                ], indicatorColor: Colors.green,),
              title: Text(
                "Global",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
            ),
            body: TabBarView(children: [HomeView(), CategoryView()]),
          ),
        ));
  }
}
