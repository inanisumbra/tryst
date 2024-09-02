
import "package:flutter/material.dart";

class StatisticPageOne extends StatefulWidget {
  const StatisticPageOne({Key? key}) : super(key: key);

  @override
  _StatisticOneState createState() => _StatisticOneState();
}

class _StatisticOneState extends State<StatisticPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up one"),
      ),
      body: const Text("Sign up page one"),
    );
  }
}
