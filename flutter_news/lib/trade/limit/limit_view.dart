import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    _controller.addListener(_handlePriceTextField);
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handlePriceTextField() {
    print("Price text field: ${_controller.text}");
  }

  FlatButton _createFlatButton(String title) {
    return FlatButton(
      color: Color(0x0D000000),
      textColor: Color(0xFF999999),
      disabledColor: Color(0xFFF7F8FA),
      disabledTextColor: Color(0xFF999999),
      padding: EdgeInsets.all(2.0),
      splashColor: Colors.blueAccent,
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(fontSize: 12.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:5.0, bottom: 5,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 32, maxWidth: MediaQuery.of(context).size.width,),
            child: TextField(
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Price',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Text('Est.Value', style: TextStyle(color: Color(0xFF999999)),),
                SizedBox(height: 2, width: 2,),
                Text('¥15.89', style: TextStyle(color: Color(0xFF333333)),),
              ],
            ),
          ),
          Container(
            height: 32,
            child: TextField(
              onChanged: (String value) {},
              onSubmitted: (String value) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Amount',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ButtonTheme(
                minWidth: 55,
                height: 24,
                child: _createFlatButton('10%'),
              ),
              ButtonTheme(
                minWidth: 55,
                height: 24,
                child: _createFlatButton('20%'),
              ),
              ButtonTheme(
                minWidth: 55,
                height: 24,
                child: _createFlatButton('50%'),
              ),
              ButtonTheme(
                minWidth: 55,
                height: 24,
                child: _createFlatButton('100%'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
