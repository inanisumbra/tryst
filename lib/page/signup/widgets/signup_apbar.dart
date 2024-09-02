import 'package:flutter/material.dart';
import 'package:polynectr/const/color_const.dart';
import 'package:polynectr/const/icons.dart';
import 'package:polynectr/page/signup/widgets/signup_arrow_button.dart';

class SignupApbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const SignupApbar({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: FractionalOffset(0.5, 0.0), end: FractionalOffset(0.6, 0.8),
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.0, 0.9], colors: [themeYellow, themeBlue],
      )),
      child: NavigationToolbar(
        leading: Align(
          alignment: const Alignment(-0.5, 4),
          child: SignUpArrowButton(
            onTap: () => Navigator.maybePop(context),
            icon: const IconData(
              arrow_left,
              fontFamily: "Icons",
            ),
            iconSize: 9,
            height: 48,
            width: 48,
          ),
        ),
        centerMiddle: true,
        middle: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
