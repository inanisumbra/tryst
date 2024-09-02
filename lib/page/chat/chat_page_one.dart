import 'package:polynectr/page/chat/chat_page_two.dart';
import 'package:polynectr/page/chat/constant.dart';
import 'package:polynectr/page/chat/style.dart';
import 'package:flutter/material.dart';

class ChatPageOne extends StatelessWidget {
  const ChatPageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5b61b9),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30, left: 40),
            height: 220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PrimaryText(
                  text: 'Chat with\nyour friends',
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: avatarList.length,
                    itemBuilder: (context, index) => Avatar(avatarUrl: avatarList[index]['avatar'] as String),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            height: MediaQuery.of(context).size.height - 220,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) => chatElement(userList[index]['avatar'] as String, context, userList[index]['name'] as String, userList[index]['message'] as String, userList[index]['time'] as String),
            ),
          )
        ],
      ),
    );
  }

  Widget chatElement(String avatarUrl, BuildContext context, String name, String message, String time) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: ListTile(
        onTap: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const ChatPageTwo()))
        },
        leading: Avatar(avatarUrl: avatarUrl),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PrimaryText(text: name, fontSize: 18),
            PrimaryText(text: time, color: Colors.grey[400] as Color, fontSize: 14),
          ],
        ),
        subtitle: PrimaryText(
            text: message,
            color: Colors.grey[600] as Color,
            fontSize: 14,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
