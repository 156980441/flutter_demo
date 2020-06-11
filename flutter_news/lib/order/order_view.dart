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

    OrderModel model = OrderModel('Buy', 'BTC/USDT', '07.05 17:50:45',
        '0.2 BTC', '203.8 USDT', '0.03 BTC', '20 USDT');
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
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(2.0),
                    color: Colors.green,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        _orders[index].direction,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      _orders[index].symbol,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      _orders[index].ctime,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),

              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Amount ${_orders[index].amount}',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Filled ${_orders[index].filled}',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),

                    ],
                  ),

                  Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Price ${_orders[index].price}',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Avg Price ${_orders[index].margin}',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
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
      width: MediaQuery.of(context).size.width,
      height: 96,
    );
  }
}
