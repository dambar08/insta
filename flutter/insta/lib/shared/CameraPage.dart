import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum CameraPageType { post, story, live }

class CameraPage extends StatefulWidget {
  const CameraPage(
      {Key? key, required this.camera, this.initialType = CameraPageType.story})
      : super(key: key);

  final initialType;
  final CameraDescription camera;

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  Future<void>? _controllerFuture;

  Future<void>? _initializeControllerFuture() async {
    _controllerFuture = _controller.initialize();
  }

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.ultraHigh,
    );
    _controllerFuture = _controller.initialize();
  }

  Widget _buildOverlay() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.settings),
              Icon(Icons.flash_off),
              Icon(Icons.close),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.preview),
              Icon(Icons.camera),
              Icon(Icons.switch_camera),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _controllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Expanded(
                  child: CameraPreview(_controller, child: _buildOverlay()),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: _buildOverlay(),
                ),
              ],
            );
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     try {
      //       await _initializeControllerFuture;
      //       final image = await _controller.takePicture();
      //     } catch (e) {
      //       print(e);
      //     }
      //   },
      //   child: const Icon(Icons.camera_alt),
      // ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
