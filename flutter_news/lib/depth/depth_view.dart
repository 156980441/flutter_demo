import 'package:flutter/material.dart';
import 'package:flutternews/model/depth_model.dart';

class DepthView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DepthViewState();
  }
}

class _DepthViewState extends State<DepthView> {
  List<DepthModel> _buyDepth = List<DepthModel>();
  List<DepthModel> _sellDepth = List<DepthModel>();
  final int _length = 5;
  String _dropdownValue = '0.01';
  @override
  void initState() {
    super.initState();

    for (int i = 0; i < _length; i++) {
      DepthModel model =
          DepthModel('Buy', '0.234534534535 BTC', '203.834534 USD');
      _buyDepth.add(model);
    }

    for (int i = 0; i < _length; i++) {
      DepthModel model =
          DepthModel('Buy', '0.234534534535 BTC', '203.834534 USD');
      _sellDepth.add(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DropdownButton<String>(
          value: _dropdownValue,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 24,
          style: TextStyle(color: Color(0xFF666666)),
          underline: Container(
            height: 0,
            color: Colors.white,
          ),
          onChanged: (String newValue) {
            setState(() {
              _dropdownValue = newValue;
            });
          },
          items: <String>['0.01', '0.001', '0.0001', '0.00001']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          color: Color(0xFFF0F1F3),
          margin: const EdgeInsets.only(
            top: 1,
            bottom: 1,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Price',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, color: Color(0xFF999999)),
            ),
            Text(
              'Amount',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, color: Color(0xFF999999)),
            ),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(),
          itemExtent: 18,
          itemBuilder: (BuildContext context, int index) {
            return _getBuyItem(context, index, Colors.red);
          },
          itemCount: _length,
        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          color: Color(0xFFF0F1F3),
          margin: const EdgeInsets.only(
            top: 3,
            bottom: 3,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(),
          itemExtent: 18,
          itemBuilder: (BuildContext context, int index) {
            return _getBuyItem(context, index, Colors.green);
          },
          itemCount: _length,
        ),
      ],
    );
  }

  Widget _getBuyItem(BuildContext context, int index, Color color) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: GestureDetector(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                _buyDepth[index].price,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11, color: color),
              ),
              Text(
                _buyDepth[index].amount,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11, color: Color(0xFF767678)),
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
