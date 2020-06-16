import 'package:flutter/material.dart';

class StrategyHeaderView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StrategyHeaderViewState();
  }
}

class _StrategyHeaderViewState extends State<StrategyHeaderView> {

  String _dropdownValue = 'Limit Price';

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  FlatButton _createFlatButton(String title) {
    return FlatButton(
      color: Color(0xFFF7F8FA),
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
      padding: EdgeInsets.only(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width / 2,
                height: 30,
                child: _createFlatButton('Buy'),
              ),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width / 2,
                height: 30,
                child: _createFlatButton('Sell'),
              ),
            ],
          ),
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
            items: <String>['Limit Price', 'Market Price', 'Trigger Price', 'TWAD']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
