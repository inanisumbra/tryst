
import "package:flutter/material.dart";

class ShopPageOne extends StatefulWidget {
  const ShopPageOne({Key? key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<ShopPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping one"),
      ),
      body: const Text("Shopping page one"),
    );
  }
}
