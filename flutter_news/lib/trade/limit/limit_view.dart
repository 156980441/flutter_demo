import 'package:flutter/material.dart';
import 'package:flutternews/trade/model/limit_commit_model.dart';

class LimitView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LimitViewState();
  }
}

class _LimitViewState extends State<LimitView> {
  LimitCommitModel _commitModel = LimitCommitModel();
  TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 121,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: _controller,
            onChanged: (String value) {},
            onSubmitted: (String value) {},
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Price',
            ),
          ),
          Text('Est.Value'),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Amount',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ButtonTheme(
                minWidth: 55,
                height: 24,
                child: FlatButton(
                  color: Color(0xFFF7F8FA),
                  textColor: Color(0xFF999999),
                  disabledColor: Color(0xFFF7F8FA),
                  disabledTextColor: Color(0xFF999999),
                  padding: EdgeInsets.all(2.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {},
                  child: Text(
                    "10%",
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ),
              ButtonTheme(
                minWidth: 55,
                height: 24,
                child: FlatButton(
                  color: Color(0xFFF7F8FA),
                  textColor: Color(0xFF999999),
                  disabledColor: Color(0xFFF7F8FA),
                  disabledTextColor: Color(0xFF999999),
                  padding: EdgeInsets.all(2.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {},
                  child: Text(
                    "20%",
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ),
              ButtonTheme(
                minWidth: 55,
                height: 24,
                child: FlatButton(
                  color: Color(0xFFF7F8FA),
                  textColor: Color(0xFF999999),
                  disabledColor: Color(0xFFF7F8FA),
                  disabledTextColor: Color(0xFF999999),
                  padding: EdgeInsets.all(2.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {},
                  child: Text(
                    "50%",
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ),
              ButtonTheme(
                minWidth: 55,
                height: 24,
                child: FlatButton(
                  color: Color(0xFFF7F8FA),
                  textColor: Color(0xFF999999),
                  disabledColor: Color(0xFFF7F8FA),
                  disabledTextColor: Color(0xFF999999),
                  padding: EdgeInsets.all(2.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {},
                  child: Text(
                    "100%",
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
