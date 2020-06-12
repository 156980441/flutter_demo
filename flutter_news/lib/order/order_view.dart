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
      color: Colors.amber,
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          _orders[index].direction,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5, right: 15),
                      child: Center(
                        child: Text(
                          _orders[index].symbol,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _orders[index].ctime,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ),
                    ButtonTheme(
                      minWidth: 59,
                      height: 24,
                      child: FlatButton(
                        color: Colors.white,
                        textColor: Colors.blue,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.grey,
                        padding: EdgeInsets.all(2.0),
                        splashColor: Colors.blueAccent,
                        onPressed: () {},
                        child: Text(
                          "Cancel",
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ),
                    ),
                  ],
                ),
                height: 24,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Amount ${_orders[index].amount}',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Filled ${_orders[index].filled}',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Price ${_orders[index].price}',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Avg Price ${_orders[index].margin}',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width,
          color: Colors.orange,
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
    );
  }
}
