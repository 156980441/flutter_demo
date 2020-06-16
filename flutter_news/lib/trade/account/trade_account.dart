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
      height: 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('Avail'),
              Text('0.00000001 BTC'),
            ],
          ),
          Row(
            children: <Widget>[
              Text('Max buy'),
              Text('0.00000002 BTC'),
            ],
          ),
        ],
      ),
    );
  }
}
