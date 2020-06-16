import 'package:flutter/material.dart';
import 'package:flutternews/trade/account/trade_account.dart';
import 'package:flutternews/trade/limit/limit_view.dart';
import 'package:flutternews/trade/strategy/strategy_header_view.dart';

class ComposedTradeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ComposedTradeViewState();
  }
}

class _ComposedTradeViewState extends State<ComposedTradeView> {
  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 5.0,
        bottom: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StrategyHeaderView(),
          LimitView(),
          TradeAccountView(),
          FlatButton(
            onPressed: () {},
            child: Text(
              'Buy',
              style: TextStyle(fontSize: 12.0),
            ),
          ),
        ],
      ),
    );
  }
}
