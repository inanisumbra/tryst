import 'package:flutter/material.dart';
import 'package:polynectr/util/GradientUtil.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.onMenuPressed, {Key? key}) : super(key: key);
  final VoidCallback onMenuPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: GradientUtil.bluePurple(),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            offset: Offset(2.0, 1.0),
            blurRadius: 10.0,
          )
        ],
      ),
      child: Center(
        child: ElevatedButton(
          onPressed: onMenuPressed,
          child: const Text("Open Menu"),
        ),
      ),
    );
  }
}
