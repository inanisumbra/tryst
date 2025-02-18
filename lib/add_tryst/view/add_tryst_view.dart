

import 'package:flutter/material.dart';
import 'package:tryst/home/widgets/widgets.dart';

class AddTrystView extends StatefulWidget {
  const AddTrystView({super.key});
  @override
  State<AddTrystView> createState() => _AddTrystViewState();
}

class _AddTrystViewState extends State<AddTrystView> with TickerProviderStateMixin {

  late AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Liquid(
              isFlipped: true,
              controller: _animationController,
            ),
            Liquid(
              isFlipped: false,
              controller: _animationController,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1000,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}