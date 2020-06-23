import 'package:flutter/material.dart';
import 'package:flutter_native_web/flutter_native_web.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailView extends StatefulWidget {
  String url;
  String title;
  DetailView(this.title, this.url);
  @override
  State<StatefulWidget> createState() {
    return _DetailViewState(url, title);
  }
}

class _DetailViewState extends State<DetailView> {
  String url;
  String title;
  WebController _controller;
  _DetailViewState(this.url, this.title);
  @override
  void initState() {
    super.initState();
  }

  void _addCollection() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.get(this.url);
    if (data == null) {
      await prefs.setString(this.url, this.title);
      Fluttertoast.showToast(msg: "收藏成功");
    } else {
      Fluttertoast.showToast(msg: "已经添加过收藏了");
    }
  }

  @override
  Widget build(BuildContext context) {
    AppBar _appbar = AppBar(
      title: Text(title),
      actions: <Widget>[
        GestureDetector(
          child: Container(
            child: Icon(Icons.add),
            width: 60,
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("确定添加到收藏吗"),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          _addCollection();
                          Navigator.of(context).pop();
                        },
                        child: Text("确定")),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("取消")),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
    return Scaffold(
      appBar: _appbar,
      body: Container(
        child: FlutterNativeWeb(
          onWebCreated: (WebController controller) {
            _controller = controller;
            _controller.loadUrl(this.url);
          },
        ),
        width: MediaQuery.of(context).size.width,
        height:
            MediaQuery.of(context).size.height - _appbar.preferredSize.height,
      ),
    );
  }
}
