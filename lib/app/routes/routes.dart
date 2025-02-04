import 'package:flutter/widgets.dart';
import 'package:tryst/app/app.dart';
import 'package:tryst/home/home.dart';
import 'package:tryst/login/login.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
