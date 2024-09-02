import 'package:flutter/material.dart';
import 'package:polynectr/util/GradientUtil.dart';

class BackgroundCommon extends StatelessWidget {
  const BackgroundCommon({required this.child, Key? key}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(gradient: GradientUtil.bluePurple()),
      child: child);
}
