import "package:flutter/material.dart";
import 'package:polynectr/const/color_const.dart';

class ShopPageNineteen extends StatefulWidget {
  const ShopPageNineteen({Key? key}) : super(key: key);

  @override
  _ShopNineteenState createState() => _ShopNineteenState();
}

class _ShopNineteenState extends State<ShopPageNineteen> {
  Widget _backButton() {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 20),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color.fromRGBO(7, 7, 7, 1), Color.fromRGBO(59, 59, 59, 1)],
          ),
          borderRadius: BorderRadius.circular(50)),
      child: Center(
          child: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: () {
          print("Go Back");
        },
      )),
    );
  }

  List savedcards = [
    [themeRed, redLight],
    [blueDeep, blueLight],
    [themeGreen, blueLight]
  ];
  List cardname = ["Lorem Ipsum", "Mitchell johnson", "Michael Bernard"];

  Widget textfield(String hint) {
    return TextField(
      decoration: InputDecoration(
        labelText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Column(children: <Widget>[
          Container(
            //appbar
            //appbar
            height: 80,
            decoration:
                const BoxDecoration(gradient: LinearGradient(colors: [themeYellow, themeBlue])),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    alignment: FractionalOffset.center,
                    child: const Text(
                      "PAYMENT",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: FractionalOffset.centerRight,
                    margin: const EdgeInsets.only(top: 20),
                    child: IconButton(
                      icon: const Icon(
                        Icons.more_vert,
                        color: Color.fromRGBO(7, 7, 7, 1),
                        size: 30,
                      ),
                      onPressed: () {
                        print("More Vertical options needed");
                      },
                    ),
                  ),
                )
              ],
            ),
          ), //appbar end
          Expanded(
            //Button Background
            child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: AlignmentDirectional.topStart,
                  colors: [themeYellow, themeBlue],
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Stack(
                          fit: StackFit.expand,
                          alignment: Alignment.center,
                          children: <Widget>[
                            Opacity(
                              opacity: 0.5,
                              child: Image.asset(
                                "assets/images/shopping/background.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              color: const Color.fromRGBO(168, 203, 253, 0.4),
                            ),
                            ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder:
                                  (BuildContext context, int currentcardindex) {
                                return InkWell(
                                  onTap: () {
                                    print("Card Tapped:$currentcardindex");
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    margin: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors:
                                                savedcards[currentcardindex]),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      //card design
                                      children: <Widget>[
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            alignment: FractionalOffset.topLeft,
                                            child: Switch(
                                              value: true,
                                              onChanged: (bool status) {
                                                print("Switch is$status");
                                              },
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                alignment: FractionalOffset
                                                    .bottomCenter,
                                                child: const Text(
                                                  "**** **** 9012",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 4,
                                                child: Text(
                                                    cardname[currentcardindex]
                                                        .toString()),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Container(),
                                              ),
                                              const Expanded(
                                                flex: 2,
                                                child: Text("08/23"),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ]),
                    ),
                    Expanded(
                      //formfields
                      flex: 5,
                      //formfields
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: SingleChildScrollView(
                            child: Column(
                          children: <Widget>[
                            textfield("Name on the Card"),
                            textfield("Card Number"),
                            textfield("Expiration Date"),
                            textfield("CVV")
                          ],
                        )),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: FractionalOffset.center,
                        height: 80,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(7, 7, 7, 1),
                            foregroundColor: const Color.fromRGBO(198, 193, 124, 1),
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 8, bottom: 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {},
                          child: const Text("Pay",
                              style: TextStyle(
                                fontSize: 20,
                              )),
                        ),
                      ),
                    )
                  ],
                )),
          )
        ]),
        Container(margin: const EdgeInsets.only(top: 20), child: _backButton())
      ],
    ));
  }
}
