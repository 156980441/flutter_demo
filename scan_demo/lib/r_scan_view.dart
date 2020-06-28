import 'dart:io';

import 'package:flutter/material.dart';
import 'package:r_scan/r_scan.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:scandemo/r_scan/scan_image_view.dart';

typedef ScanCallback = Future<void> Function();

class RScanCameraDialog extends StatefulWidget {
  final List<RScanCameraDescription> rScanCameras;
  RScanCameraDialog(this.rScanCameras);
  @override
  _RScanCameraDialogState createState() =>
      _RScanCameraDialogState(rScanCameras);
}

class _RScanCameraDialogState extends State<RScanCameraDialog> {
  RScanResult result;
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
    AppBar _appbar = AppBar(
      backgroundColor: Color(0x000000),
      title: Text('Scan'),
      actions: <Widget>[
        GestureDetector(
          child: Container(
            child: Icon(Icons.add_photo_alternate),
            width: 60,
          ),
          onTap: () async {
            if (await canReadStorage()) {
              final ImagePicker picker = ImagePicker();
              var image =
                  await picker.getImage(source: ImageSource.gallery);
              if (image != null) {
                final result = await RScan.scanImagePath(image.path);
                setState(() {
                  this.result = result;
                });
              }
            }
          },
        ),
      ],
    );

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
      appBar: _appbar,
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ScanImageView(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: RScanCamera(_controller),
            ),
          ),
          Container (child: Text('二维码解析错误，请核对后再次尝试', style:TextStyle(color: Colors.white, fontSize: 11),),),
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

  Future<bool> canReadStorage() async {
    if (Platform.isIOS) return true;
    var status = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);
    if (status != PermissionStatus.granted) {
      var future = await PermissionHandler()
          .requestPermissions([PermissionGroup.storage]);
      for (final item in future.entries) {
        if (item.value != PermissionStatus.granted) {
          return false;
        }
      }
    } else {
      return true;
    }
    return true;
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
