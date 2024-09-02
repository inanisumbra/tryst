
import 'package:flutter/material.dart';
import 'package:polynectr/const/color_const.dart';
import 'package:polynectr/const/gradient_const.dart';
import 'package:polynectr/const/images_const.dart';
import 'package:polynectr/const/size_const.dart';
import 'package:polynectr/const/string_const.dart';
import 'package:polynectr/page/signup/widgets/signup_arrow_button.dart';

class SignPageFour extends StatefulWidget {
  const SignPageFour({Key? key}) : super(key: key);

  @override
  _SignPageFourState createState() => _SignPageFourState();
}

class _SignPageFourState extends State<SignPageFour> {
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
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 60.0, horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Image.asset(
                            SignUpImagePath.SignUpLogo,
                            height: media.height / 7,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "WELCOME BACK!",
                          style: TextStyle(
                            letterSpacing: 4,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            fontSize: TEXT_LARGE_SIZE,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Log in',
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w200,
                              fontSize: 40),
                        ),
                        const Text(
                          'to continue.',
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w200,
                              fontSize: 40),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: media.height / 3.8,
                          decoration: BoxDecoration(
                            gradient: SIGNUP_CARD_BACKGROUND,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 15,
                                spreadRadius: 8,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: inputText("USERNAME",
                                      'hristov123@gmail.com', _username, false),
                                ),
                                const Divider(
                                  height: 5,
                                  color: Colors.black,
                                ),
                                Expanded(
                                    child: inputText(
                                        "PASSWORD", '******', _password, true)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
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
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
              Positioned(
                bottom: media.height / 6.3,
                right: 15,
                child: SignUpArrowButton(
                  icon: const IconData(0xe901, fontFamily: 'Icons'),
                  iconSize: 9,
                  onTap: () => print("Signup Tapped"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputText(
    String fieldName,
    String hintText,
    TextEditingController controller,
    bool obSecure,
  ) {
    return TextField(
      style: const TextStyle(height: 1.3),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: fieldName,
        labelStyle: const TextStyle(
          fontSize: TEXT_NORMAL_SIZE,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w400,
          letterSpacing: 1,
          height: 0,
        ),
        border: InputBorder.none,
      ),
      obscureText: obSecure,
    );
  }
}
