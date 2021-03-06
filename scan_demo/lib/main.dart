import 'package:flutter/material.dart';
import 'package:r_scan/r_scan.dart';

import 'package:scandemo/barcode_scan_view.dart';
import 'package:scandemo/r_scan_view.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scan in Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scan in Flutter'),
        ),
        body: Center(
          child: MainView(),
        ),
      ),
    );
  }
}

class MainView extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MainView> {
  final _suggestions = ['Barcode', 'QR', 'RScran'];

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      itemCount: _suggestions.length,
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          return _buildRow(_suggestions[i], i);
        });
  }

  Widget _buildRow(String pair, int index) {
    return GestureDetector(
      child: ListTile(
        title: Text(pair),
      ),
      onTap: () async {
        Widget tmp;
        if (index == 0 ) {
          tmp = BarcodeScan();
        } else if (index == 1) {
          tmp = BarcodeScan();
        } else if (index == 2) {
          List<RScanCameraDescription> rScanCameras = await availableRScanCameras();
          tmp = RScanCameraDialog(rScanCameras);
        }
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) {
              return tmp;
            },
          ),
        );
      },
    );
  }
}
