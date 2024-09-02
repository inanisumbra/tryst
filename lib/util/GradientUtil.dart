
import "package:flutter/material.dart";
import 'package:polynectr/const/color_const.dart';

class GradientUtil {
  static LinearGradient _getLinearGradient(Color left, Color right,
          {begin = AlignmentDirectional.centerStart,
          end = AlignmentDirectional.centerEnd,
          opacity = 1.0}) =>
      LinearGradient(
        colors: [
          left.withOpacity(opacity),
          right.withOpacity(opacity),
        ],
        begin: begin,
        end: end,
      );

  static LinearGradient yellowGreen(
          {begin = AlignmentDirectional.centerStart,
          end = AlignmentDirectional.centerEnd,
          opacity = 1.0}) =>
      _getLinearGradient(themeYellow, themeGreen,
          begin: begin, end: end, opacity: opacity);

  static LinearGradient red(
          {begin = AlignmentDirectional.centerStart,
          end = AlignmentDirectional.centerEnd,
          opacity = 1.0}) =>
      _getLinearGradient(redLight, themeRed,
          begin: begin, end: end, opacity: opacity);

  static LinearGradient yellowBlue(
          {begin = AlignmentDirectional.centerStart,
          end = AlignmentDirectional.centerEnd,
          opacity = 1.0}) =>
      _getLinearGradient(themeYellow, themeBlue,
          begin: begin, end: end, opacity: opacity);

  static LinearGradient blue(
          {begin = AlignmentDirectional.centerStart,
          end = AlignmentDirectional.centerEnd,
          opacity = 1.0}) =>
      _getLinearGradient(blueLight, blueDeep,
          begin: begin, end: end, opacity: opacity);

  static LinearGradient greenRed(
          {begin = AlignmentDirectional.centerStart,
          end = AlignmentDirectional.centerEnd,
          opacity = 1.0}) =>
      _getLinearGradient(themeGreen, themeRed, begin: begin, end: end, opacity: opacity);

  static LinearGradient greenPurple(
          {begin = AlignmentDirectional.centerStart,
          end = AlignmentDirectional.centerEnd,
          opacity = 1.0}) =>
      _getLinearGradient(themeGreen, purple,
          begin: begin, end: end, opacity: opacity);

   static LinearGradient bluePurple(
          {begin = AlignmentDirectional.topCenter,
          end = AlignmentDirectional.bottomCenter,
          opacity = 1.0}) =>
      _getLinearGradient(blueDeep, purple,
          begin: begin, end: end, opacity: opacity);
}
