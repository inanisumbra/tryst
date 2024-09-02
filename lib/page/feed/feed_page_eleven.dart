
import "package:flutter/material.dart";
import 'top_title.dart';
import "package:polynectr/util/SizeUtil.dart";
import 'package:polynectr/const/color_const.dart';
import 'feed_const.dart';

class FeedPageEleven extends StatefulWidget {
  const FeedPageEleven({Key? key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<FeedPageEleven>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  var curTab = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {
        curTab = tabController.index;
      });
    });
  }

  Widget _textBack(content,
          {color = textBlackLight,
          size = TEXT_SMALL_2_SIZE,
          isBold = false}) =>
      Text(
        content,
        style: TextStyle(
            color: color,
            fontSize: SizeUtil.getAxisBoth(size),
            fontWeight: isBold ? FontWeight.w700 : null),
      );

  Widget _listItemContent() => Positioned(
        bottom: 0.1,
        left: SizeUtil.getAxisX(136.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              SizeUtil.getAxisBoth(22.0),
            ),
            gradient: const LinearGradient(colors: [redLight, themeRed]),
          ),
          height: SizeUtil.getAxisY(182.0),
          width: SizeUtil.getAxisY(528.0),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: SizeUtil.getAxisY(27.0),
                left: SizeUtil.getAxisX(87.0),
                child: _textBack("Blanche Garcia",
                    size: TEXT_SMALL_3_SIZE, isBold: true),
              ),
              Positioned(
                top: SizeUtil.getAxisY(66.0),
                left: SizeUtil.getAxisX(87.0),
                child:
                    _textBack("Netherlands Antilles", size: TEXT_NORMAL_SIZE),
              ),
              Positioned(
                top: SizeUtil.getAxisY(27.0),
                right: SizeUtil.getAxisX(33.0),
                child: _textBack("31 Dec"),
              ),
              Positioned(
                bottom: SizeUtil.getAxisY(30.0),
                left: SizeUtil.getAxisX(90.0),
                child: Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.favorite_border,
                        color: textBlack,
                        size: SizeUtil.getAxisBoth(30.0),
                      ),
                      SizedBox(
                        width: SizeUtil.getAxisX(16.0),
                      ),
                      _textBack("72"),
                      SizedBox(
                        width: SizeUtil.getAxisX(45.0),
                      ),
                      Icon(
                        Icons.chat,
                        color: textBlack,
                        size: SizeUtil.getAxisBoth(30.0),
                      ),
                      SizedBox(
                        width: SizeUtil.getAxisX(16.0),
                      ),
                      _textBack("44"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _listItem(index) => Container(
        alignment: AlignmentDirectional.topStart,
        constraints: BoxConstraints.expand(height: SizeUtil.getAxisY(850.0)),
        child: Stack(
          children: <Widget>[
            Container(
              alignment: AlignmentDirectional.topStart,
              margin: EdgeInsets.only(
                top: SizeUtil.getAxisY(45.0),
                bottom: SizeUtil.getAxisY(84.0),
                left: SizeUtil.getAxisX(30.0),
                right: SizeUtil.getAxisX(30.0),
              ),
              child: Image.asset(
                index % 2 == 0
                    ? FeedImage.feed11_city1
                    : FeedImage.feed11_city2,
                fit: BoxFit.cover,
              ),
            ),
            _listItemContent(),
            Positioned(
              width: SizeUtil.getAxisBoth(100.0),
              height: SizeUtil.getAxisBoth(100.0),
              bottom: SizeUtil.getAxisY(41.0),
              left: SizeUtil.getAxisX(81.0),
              child: Image.asset(FeedImage.feed11_header),
            ),
          ],
        ),
      );

  Widget _listContainer() => Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return _listItem(index);
          },
          itemCount: 4,
          padding: const EdgeInsets.only(top: 0.1),
        ),
      );

  Widget _tabTitleItem(title, isCurrent) => Container(
        width: SizeUtil.getAxisX(220.0),
        height: SizeUtil.getAxisY(154.0),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: isCurrent
                    ? [redLight, themeRed]
                    : [const Color(0x44FFFFFF), const Color(0x44FFFFFF)]),
            borderRadius: BorderRadius.circular(
              SizeUtil.getAxisX(22.0),
            ),
            boxShadow: isCurrent
                ? [const BoxShadow(color: darkColor, offset: Offset(0.0, 2.0))]
                : null),
        child: Text(
          title,
          style: TextStyle(
            color: textBlack,
            fontSize: SizeUtil.getAxisBoth(TEXT_SMALL_2_SIZE),
          ),
        ),
      );

  Widget _tabView(context) {
    return DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              constraints:
                  BoxConstraints.expand(height: SizeUtil.getAxisY(154.0)),
              child: TabBar(
                controller: tabController,
                tabs: [
                  _tabTitleItem("Products", curTab == 0),
                  _tabTitleItem("Recent", curTab == 1),
                  _tabTitleItem("News", curTab == 2),
                ],
                isScrollable: false,
                indicatorWeight: 0.0001,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  _listContainer(),
                  _listContainer(),
                  _listContainer(),
                ],
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            const BoxDecoration(gradient: LinearGradient(colors: [themeYellow, themeGreen])),
        child: Column(
          children: <Widget>[
            const TopTitleBar(),
            SizedBox(
              height: SizeUtil.getAxisY(43.0),
            ),
            Expanded(
              child: _tabView(context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
