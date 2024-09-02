
import "package:flutter/material.dart";

class WalkThPageOne extends StatefulWidget {
  const WalkThPageOne({Key? key}) : super(key: key);

  @override
  _WalkThState createState() => _WalkThState();
}

class _WalkThState extends State<WalkThPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Walk through one"),
      ),
      body: const Text("Walk through page one"),
    );
  }
}
