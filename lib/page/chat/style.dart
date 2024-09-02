import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
   final String text;
   final Color color;
   final double fontSize;
   final FontWeight fontWeight;
   final TextOverflow overflow;

  const PrimaryText({Key? key, 
    required this.text,
    this.color = Colors.black,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w700,
    this.overflow = TextOverflow.visible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: 'Quicksand',
        fontWeight: fontWeight,
      ),
    );
  }
}


class Avatar extends StatelessWidget {
  final String avatarUrl;
  final double width;
  final double height;

  const Avatar({Key? key, 
    required this.avatarUrl,
    this.width = 60,
    this.height = 60,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(50),
          image:
              DecorationImage(image: AssetImage(avatarUrl), fit: BoxFit.cover)),
    );
  }
}
