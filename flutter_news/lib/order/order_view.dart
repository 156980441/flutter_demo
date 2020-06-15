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

    OrderModel model = OrderModel(
        'Buy',
        'BTC/USD',
        '07.05 17:50:45',
        '0.234534534535 BTC',
        '203.834534 USD',
        '0.03345345 BTC',
        '20.74656736 USD');
    OrderModel model2 = OrderModel(
        'Buy',
        'BTC/USD',
        '07.05 17:50:45',
        '0.234534534535 BTC',
        '203.834534 USD',
        '0.03345345 BTC',
        '20.74656736 USD');
    _orders.add(model);
    _orders.add(model2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return _getItem(context, index);
        },
        itemCount: _orders.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 1,
          color: Color(0xFFCCCCCC),
        ),
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
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 4, bottom: 4),
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
                          style:
                              TextStyle(fontSize: 12, color: Color(0xFFCCCCCC)),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Amount',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF666666)),
                              ),
                              SizedBox(height: 1, width: 2,),
                              Text(
                                '${_orders[index].amount}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF333333)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Filled',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF666666)),
                              ),
                              SizedBox(height: 1, width: 2,),
                              Text(
                                '${_orders[index].filled}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF333333)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Price',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF666666)),
                              ),
                              SizedBox(height: 1, width: 2,),
                              Text(
                                '${_orders[index].price}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF333333)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Avg Price',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF666666)),
                              ),
                              SizedBox(height: 1, width: 2,), // 我这里放了一个 SizedBox 来充当间距，不知道这种用法是否可取，还是说我应该弄个 Container 来设置 padding or margin
                              Text(
                                '${_orders[index].margin}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF333333)),
                              ),
                            ],
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
