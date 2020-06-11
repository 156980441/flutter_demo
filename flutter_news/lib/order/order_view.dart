import 'package:flutter/material.dart';
import 'package:flutternews/model/order_model.dart';

class OrderView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OrderViewState();
  }
}

class _OrderViewState extends State<OrderView> {
  List<OrderModel> _orders = List<OrderModel>();
  @override
  void initState() {
    super.initState();

    OrderModel model = OrderModel('Buy', 'BTC/USDT', '07.05 17:50:45', '0.2 BTC',
        '203.8 USDT', '0.03 BTC', '20 USDT');
    _orders.add(model);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _getItem(context, index);
        },
        itemCount: _orders.length,
      ),
    );
  }

  Widget _getItem(BuildContext context, int index) {
    return Container(
      child: Row(
        children: <Widget>[
          GestureDetector(
            child: Container(
              child: Center(
                child: Text(
                  _orders[index].symbol,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              color: index % 2 == 0 ? Colors.orange : Colors.blueAccent,
              height: 130,
            ),
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (BuildContext context) {
                  return null;
                }),
              );
            },
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      height: 130,
    );
  }
}
