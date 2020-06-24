import 'package:flutter/material.dart';
import 'package:r_scan/r_scan.dart';
import 'package:scandemo/r_scan/scan_image_view.dart';

class RScanCameraDialog extends StatefulWidget {
  List<RScanCameraDescription> rScanCameras;
  RScanCameraDialog(this.rScanCameras);
  @override
  _RScanCameraDialogState createState() => _RScanCameraDialogState(rScanCameras);
}

class _RScanCameraDialogState extends State<RScanCameraDialog> {
  RScanCameraController _controller;
  bool isFirst = true;

  List<RScanCameraDescription> rScanCameras;
  _RScanCameraDialogState(this.rScanCameras);


  @override
  void initState() {
    super.initState();

    if (rScanCameras != null && rScanCameras.length > 0) {
      _controller = RScanCameraController(
          rScanCameras[0], RScanCameraResolutionPreset.max)
        ..addListener(() {
          final result = _controller.result;
          if (result != null) {
            if (isFirst) {
              Navigator.of(context).pop(result);
              isFirst = false;
            }
          }
        })
        ..initialize().then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (rScanCameras == null || rScanCameras.length == 0) {
      return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Text('not have available camera'),
        ),
      );
    }
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          ScanImageView(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: RScanCamera(_controller),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: FutureBuilder(
                future: getFlashMode(),
                builder: _buildFlashBtn,
              ))
        ],
      ),
    );
  }

  Future<bool> getFlashMode() async {
    bool isOpen = false;
    try {
      isOpen = await _controller.getFlashMode();
    } catch (_) {}
    return isOpen;
  }

  Widget _buildFlashBtn(BuildContext context, AsyncSnapshot<bool> snapshot) {
    return snapshot.hasData
        ? Padding(
      padding: EdgeInsets.only(
          bottom: 24 + MediaQuery.of(context).padding.bottom),
      child: IconButton(
          icon: Icon(snapshot.data ? Icons.flash_on : Icons.flash_off),
          color: Colors.white,
          iconSize: 46,
          onPressed: () {
            if (snapshot.data) {
              _controller.setFlashMode(false);
            } else {
              _controller.setFlashMode(true);
            }
            setState(() {});
          }),
    )
        : Container();
  }
}
