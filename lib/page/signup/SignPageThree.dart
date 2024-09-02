import 'package:flutter/material.dart';
import 'package:polynectr/const/color_const.dart';
import 'package:polynectr/const/gradient_const.dart';
import 'package:polynectr/const/images_const.dart';
import 'package:polynectr/const/string_const.dart';

import 'package:polynectr/page/signup/widgets/signup_arrow_button.dart';
import '../../const/icons.dart';

class SignPageThree extends StatefulWidget {
  const SignPageThree({Key? key}) : super(key: key);

  @override
  _SignPageThreeState createState() => _SignPageThreeState();
}

class _SignPageThreeState extends State<SignPageThree> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: SIGNUP_BACKGROUND,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 60,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        SignUpImagePath.SignUpLogo,
                        height: media.height / 7,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: media.height / 1.7,
                            width: media.width / 1.25,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                              gradient: LinearGradient(
                                  begin: FractionalOffset(0.0, 0.4),
                                  end: FractionalOffset(0.9, 0.7),
                                  // Add one stop for each color. Stops should increase from 0 to 1
                                  stops: [
                                    0.2,
                                    0.9
                                  ],
                                  colors: [
                                    Color(0xffFFC3A0),
                                    Color(0xffFFAFBD),
                                  ]),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 15,
                                  spreadRadius: 8,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30, top: 60),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    'Log in\nto continue.',
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 32),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 16.0),
                                      child: inputText(
                                          "Email", _username, false, true)),
                                  inputText("Password", _password, true, false),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: Opacity(
                              opacity: 0.6,
                              child: Container(
                                height: media.height / 1.7 - 20,
                                width: 25,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 15,
                                      spreadRadius: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Opacity(
                              opacity: 0.3,
                              child: Container(
                                height: media.height / 1.7 - 40,
                                width: 25,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 15,
                                      spreadRadius: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Opacity(
                              opacity: 0.1,
                              child: Container(
                                height: media.height / 1.7 - 60,
                                width: 25,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 15,
                                      spreadRadius: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            StringConst.SIGN_UP_TEXT,
                            style: TextStyle(color: mainColor),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () => print("Sign Up Tapped"),
                            child: const Text(StringConst.SIGN_UP),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
              Positioned(
                  top: media.height / 1.7 + media.height / 7 + 30,
                  left: 20,
                  child: SignUpArrowButton(
                    icon: const IconData(arrow_right, fontFamily: 'Icons'),
                    iconSize: 8,
                    onTap: () => print("Signup Tapped"),
                  )),
              Positioned(
                top: media.height / 1.7 + media.height / 7 - 10,
                left: 30,
                child: const Text(
                  'NEXT',
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w800,
                      fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget inputText(String hintText, TextEditingController controller,
    bool obSecure, bool border) {
  return TextField(
    style: const TextStyle(color: Color(0xff353535), fontWeight: FontWeight.bold),
    controller: controller,
    decoration: InputDecoration(
        suffixIcon: obSecure
            ? null
            : const Padding(
                padding: EdgeInsets.only(right: 32.0),
                child: Icon(IconData(0xe902, fontFamily: 'Icons'),
                    color: Color(0xff35AA90), size: 10.0),
              ),
        border: border ? const UnderlineInputBorder() : InputBorder.none,
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Color(0xff353535),
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
            fontSize: 16.0)),
    obscureText: obSecure,
  );
}
