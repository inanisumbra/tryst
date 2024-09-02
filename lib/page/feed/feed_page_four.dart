import 'package:flutter/material.dart';
import 'package:polynectr/const/color_const.dart';
import 'package:polynectr/const/shadow_const.dart';
import 'package:polynectr/page/feed/feed_const.dart';
import 'package:polynectr/page/feed/top_title.dart';
import 'package:polynectr/util/SizeUtil.dart';

const cardConsts = [
  {
    "author": "Hristo",
    "action": "added 127 new photos to Lorem ipsum dolr sit amet.",
    "time": "1 MINUTE",
    "like": "123",
    "chat": "67",
    "share": "12",
    "images_number": "+126",
    "avatar_image": FeedImage.feed1_avatar2,
    "images": [
      FeedImage.feed13_pic1,
      FeedImage.feed13_pic2,
      FeedImage.feed13_pic3,
    ]
  },
  {
    "author": "Mila",
    "action": "added 3 new photos to Lorem ipsum dolr sit amet.",
    "time": "12 HOURS",
    "like": "123",
    "chat": "67",
    "share": "12",
    "images_number": '0',
    "avatar_image": FeedImage.feed1_avatar1,
    "images": [
      FeedImage.feed13_pic1,
      FeedImage.feed13_pic2,
      FeedImage.feed13_pic3,
    ]
  },
];

class FeedPageFour extends StatefulWidget {
  const FeedPageFour({Key? key}) : super(key: key);

  @override
  _FeedPageFourState createState() => _FeedPageFourState();
}

var deviceHeight;
var deviceWidth;
Icon favIcon = const Icon(Icons.favorite_border);
Icon chatIcon = const Icon(Icons.chat);
Icon shareIcon = const Icon(Icons.share);

class _FeedPageFourState extends State<FeedPageFour> {
  Widget _cardAction(Icon icon, int number) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: <Widget>[
          icon,
          const SizedBox(width: 5),
          Text(
            '$number',
            style: TextStyle(
                color: Colors.black38,
                fontSize: SizeUtil.getAxisBoth(TEXT_NORMAL_SIZE)),
          )
        ],
      ),
    );
  }

  Widget _avatar() {
    return (Container(
      margin: EdgeInsets.only(top: 18, left: deviceWidth * 0.22),
      height: 50.0,
      width: 50.0,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(FeedImage.feed1_avatar2))),
    ));
  }

  Widget _feedCardImages() {
    return Positioned(
      top: 180.0,
      left: 26,
      child: Container(
        height: 230,
        width: 350,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20.0,
            spreadRadius: 5.0,
            offset: Offset(
              10.0, // horizontal, move right 10
              10.0, // vertical, move down 10
            ),
          )
        ], color: themeRed, borderRadius: BorderRadius.circular(22.0)),
      ),
    );
  }

  Widget _feedCard() {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: <Widget>[_pinkCard(), _avatar(), _feedCardImages()],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration:
            const BoxDecoration(gradient: LinearGradient(colors: [themeYellow, themeGreen])),
        child: Stack(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _cardClipper(),
            const TopTitleBar(),
          ],
        ),
      ),
    );
  }

  Widget timeText() => Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Text(
          cardConsts[0]['time'] as String,
          textAlign: TextAlign.right,
          style: TextStyle(
              color: Colors.black38,
              fontSize: SizeUtil.getAxisBoth(TEXT_SMALL_2_SIZE)),
        ),
      );

  Widget descriptionText() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: RichText(
          text: TextSpan(
              text: '${cardConsts[0]['author']} ',
              style: TextStyle(
                  fontSize: SizeUtil.getAxisBoth(TEXT_NORMAL_SIZE),
                  fontWeight: FontWeight.bold,
                  color: textBlack),
              children: <TextSpan>[
                TextSpan(
                    text: cardConsts[0]['action'] as String,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, color: textBlackLight))
              ]),
        ),
      );

  Widget _socialAction(Icon icon, String number) => Container(
        child: Row(
          children: <Widget>[
            icon,
            const SizedBox(width: 7),
            Text(
              number,
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: SizeUtil.getAxisBoth(TEXT_SMALL_2_SIZE)),
            )
          ],
        ),
      );

  Widget _socialActionRow() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _socialAction(favIcon, cardConsts[0]['like'] as String),
          _socialAction(chatIcon, cardConsts[0]['chat'] as String),
          _socialAction(shareIcon, cardConsts[0]['share'] as String)
        ],
      ),
    );
  }

  Widget _cardDetails() {
    return Column(
      children: <Widget>[
        timeText(),
        Expanded(child: descriptionText()),
        _socialActionRow()
      ],
    );
  }

  Widget _pinkCard() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        height: deviceHeight * 0.6,
        width: deviceWidth * 0.75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.0),
            boxShadow: SHADOW,
            gradient: const LinearGradient(colors: [redLight, themeRed])),
        child: _cardDetails(),
      ),
    );
  }

  Widget _avatarCard() {
    return Positioned(
        top: deviceHeight * 0.027,
        left: deviceWidth * 0.2,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            image: DecorationImage(
                image: AssetImage(cardConsts[0]['avatar_image'] as String)),
            boxShadow: SHADOW,
          ),
        ));
  }

  Widget _imagesCard() {
    return Positioned(
      top: deviceHeight * 0.25,
      left: deviceWidth * 0.05,
      child: Container(
        height: 250,
        width: 370,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          boxShadow: SHADOW,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      constraints: const BoxConstraints.expand(),
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(20)),
                          boxShadow: SHADOW,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(FeedImage.shop_river))),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      constraints: const BoxConstraints.expand(),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20)),
                          boxShadow: SHADOW,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(FeedImage.city))),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                constraints: const BoxConstraints.expand(),
                child: Image.asset(
                  FeedImage.feed12_pic1,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stackClipperCard() {
    return Stack(
      children: <Widget>[_pinkCard(), _avatarCard(), _imagesCard()],
    );
  }

  Widget _cardClipper() {
    return ListView(
      children: <Widget>[
        const SizedBox(
          height: 100,
        ),
        _stackClipperCard(),
        _stackClipperCard(),
      ],
    );
  }
}
