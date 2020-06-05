import 'package:flutter/material.dart';
import 'package:flutter_native_web/flutter_native_web.dart';

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

  @override
  Widget build(BuildContext context) {
    AppBar _appbar = AppBar(title:Text(title));
    return Scaffold(
      appBar: _appbar,
      body: Container(
        child: FlutterNativeWeb(
          onWebCreated: (WebController controller) {
            _controller = controller;
            controller.loadData(this.url);
          },
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - _appbar.preferredSize.height,
      ),
    );
  }
}