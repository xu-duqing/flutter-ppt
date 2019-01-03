import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CameraAppState();
  }
}

class _CameraAppState extends State<CameraWidget> {
  CameraController controller;
  List<CameraDescription> cameras;
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    _setupCameras();
  }

  Future<void> _setupCameras() async {
    try {
      // initialize cameras.
      cameras = await availableCameras();
      // initialize camera controllers.
      controller = new CameraController(cameras[0], ResolutionPreset.medium);
      await controller.initialize();
    } on CameraException catch (e) {
      // do something on error.
      print('Error: ${e.code}\nError Message: ${e.description}');
    }
    if (!mounted) return;
    setState(() {
      _isReady = true;
    });
  }


  @override
  void dispose() {
    print('guang: xxx');
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) return new Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text('正在加载相机...'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('拍个合照把😊'),
      ),
      body: AspectRatio(
          aspectRatio:
          controller.value.aspectRatio,
          child: CameraPreview(controller)),
    );
  }
}