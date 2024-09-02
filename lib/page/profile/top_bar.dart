
import "package:flutter/material.dart";
import 'profile_const.dart';
import 'package:polynectr/const/color_const.dart';
import 'package:polynectr/util/SizeUtil.dart';

class TopBar extends StatelessWidget {
  const TopBar(
      {Key? key, this.leftIcon,
      this.rightIcon,
      required this.title,
      this.onLeftIconPressed,
      this.onRightIconPressed}) : super(key: key);

  final String? leftIcon;
  final String? rightIcon;
  final String title;
  final Function()? onLeftIconPressed;
  final Function()? onRightIconPressed;

  @override
  Widget build(BuildContext context) {
    final icons = <Widget>[];
    if (leftIcon != null) {
      icons.add(InkWell(
        onTap: onLeftIconPressed,
        child: Image.asset(leftIcon as String,
            width: SizeUtil.getAxisY(CIRCLE_BUTTON_HEIGHT),
            height: SizeUtil.getAxisY(CIRCLE_BUTTON_HEIGHT)),
      ));
    }
    if (rightIcon != null) {
      icons.add(InkWell(
        onTap: onRightIconPressed,
        child: Image.asset(rightIcon as String,
            width: SizeUtil.getAxisY(CIRCLE_BUTTON_HEIGHT),
            height: SizeUtil.getAxisY(CIRCLE_BUTTON_HEIGHT)),
      ));
    }

    return Container(
      constraints:
          BoxConstraints.expand(height: SizeUtil.getAxisY(TOP_BAR_HEIGHT)),
      child: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(
                height: SizeUtil.getAxisY(TOP_BAR_GRADIENT_HEIGHT)),
            decoration:
                const BoxDecoration(gradient: LinearGradient(colors: [themeYellow, themeBlue])),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: SizeUtil.getAxisY(30.0)),
              child: Text(
                title.toUpperCase(),
                style: TextStyle(
                    color: textBlack,
                    fontSize: SizeUtil.getAxisBoth(TEXT_SIZE_L),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: SizeUtil.getAxisX(24.0)),
            alignment: AlignmentDirectional.bottomStart,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: icons),
          )
        ],
      ),
    );
  }
}
