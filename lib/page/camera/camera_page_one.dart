
import "package:flutter/material.dart";

class CameraPageOne extends StatefulWidget {
  const CameraPageOne({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<CameraPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Camera one"),
      ),
      body: const Text("Camera page one"),
    );
  }
}
