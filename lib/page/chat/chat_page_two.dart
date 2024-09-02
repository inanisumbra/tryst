import 'package:polynectr/page/chat/constant.dart';
import 'package:polynectr/page/chat/style.dart';
import 'package:flutter/material.dart';

class ChatPageTwo extends StatelessWidget {
  const ChatPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xff5b61b9),
      body: ListView(
        children: [customAppBar(context), header(), chatArea(context)],
      ),
    );
  }

  Container chatArea(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height - 255,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(40)),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 355,
              padding: const EdgeInsets.only(top: 50, left: 40, right: 40),
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) => 
                  messages[index]['from'] == 'sender' ? sender(messages[index]['message'] as String, messages[index]['time'] as String) : receiver(messages[index]['message'] as String, messages[index]['time'] as String)
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  hintText: 'Type your message...',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RawMaterialButton(
                      constraints: const BoxConstraints(minWidth: 0),
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: const Color(0xff5b61b9),
                      padding: const EdgeInsets.all(10.0),
                      shape: const CircleBorder(),
                      child: const Icon(Icons.send, size: 22.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Padding header() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const PrimaryText(
            text: 'Tannaz\nSaddegi',
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RawMaterialButton(
                constraints: const BoxConstraints(minWidth: 0),
                onPressed: () {},
                elevation: 2.0,
                fillColor: Colors.white38,
                padding: const EdgeInsets.all(10.0),
                shape: const CircleBorder(),
                child: const Icon(Icons.call, size: 24.0, color: Colors.white),
              ),
              const SizedBox(width: 10),
              RawMaterialButton(
                constraints: const BoxConstraints(minWidth: 0),
                onPressed: () {},
                elevation: 2.0,
                fillColor: Colors.white38,
                padding: const EdgeInsets.all(10.0),
                shape: const CircleBorder(),
                child: const Icon(Icons.video_call, size: 24.0, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }

  Padding customAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              child: const PrimaryText(text: 'Back', color: Colors.white54),
              onPressed: () => {Navigator.pop(context)}),
          const TextButton(
              onPressed: null,
              child: PrimaryText(text: 'Search', color: Colors.white54)),
        ],
      ),
    );
  }

  Widget sender(String message, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: PrimaryText(
                text: time, color: Colors.grey[400] as Color, fontSize: 14),
          ),
          Container(
            constraints: const BoxConstraints(minWidth: 100, maxWidth: 280),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(0))),
            child: PrimaryText(
              text: message,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget receiver(String message, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Avatar(avatarUrl: 'assets/avatar-1.png', width: 30, height: 30),
              Container(
                constraints: const BoxConstraints(minWidth: 100, maxWidth: 200),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(25))),
                child: PrimaryText(
                  text: message,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: PrimaryText(
                text: time, color: Colors.grey[400] as Color, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
