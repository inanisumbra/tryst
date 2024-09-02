import "package:flutter/material.dart";

import '../../const/gradient_const.dart';
import 'widgets/date_picker.dart';
import 'widgets/gender_picker.dart';
import 'widgets/location_picker.dart';
import 'widgets/signup_apbar.dart';
import 'widgets/signup_profile_image_picker.dart';
import 'widgets/signup_button.dart';

class SignPageTwo extends StatelessWidget {
  const SignPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SignupApbar(
        title: 'CREATE ACCOUNT',
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 64.0),
        decoration: const BoxDecoration(gradient: SIGNUP_BACKGROUND),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            const Center(
              child: ProfileImagePicker(
                
                margin: EdgeInsets.only(top: 32.0, left: 32.0, right: 32.0),
              ),
            ),
            const DatePicker(),
            const GenderPicker(),
            const LocationPicker(),
            Container(
                margin: const EdgeInsets.only(top: 32.0),
                child: Center(child: signupButton('NEXT')))
          ],
        ),
      ),
    );
  }
}
