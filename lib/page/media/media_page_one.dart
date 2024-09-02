
import "package:flutter/material.dart";

class MediaPageOne extends StatefulWidget {
  const MediaPageOne({Key? key}) : super(key: key);

  @override
  _MediaState createState() => _MediaState();
}

class _MediaState extends State<MediaPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Media one"),
      ),
      body: const Text("Media page one"),
    );
  }
}
