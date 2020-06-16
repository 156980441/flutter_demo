import 'package:flutter/material.dart';

class TradeAccountView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TradeAccountViewState();
  }
}

class _TradeAccountViewState extends State<TradeAccountView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('Avail', style: TextStyle(color: Color(0xFF999999)),),
              SizedBox(height: 2, width: 2,),
              Text('0.00000001 USD', style: TextStyle(color: Color(0xFF999999)),),
            ],
          ),
          Row(
            children: <Widget>[
              Text('Max buy', style: TextStyle(color: Color(0xFF999999)),),
              SizedBox(height: 2, width: 2,),
              Text('0.00000002 BTC', style: TextStyle(color: Color(0xFF999999)),),
            ],
          ),
        ],
      ),
    );
  }
}
