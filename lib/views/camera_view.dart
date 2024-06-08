import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pathbuddy/controller/scan_controller.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Camera View'),
      ),
      body: GetBuilder<ScanController>(
          init: ScanController(),
          builder: (controller) {
            return controller.isCameraInitialized.value
                ? CameraPreview(controller.cameraController)
                : const Center(
                    child: Text("Loading Camera..."),
                  );
          }),
    );
  }
}
