
import "package:flutter/material.dart";
import 'package:polynectr/const/shadow_const.dart';
import 'package:polynectr/item/menu_stream.dart';
import 'package:polynectr/item/menu.dart';
import 'package:polynectr/const/string_const.dart';
import 'package:polynectr/const/size_const.dart';
import 'package:polynectr/const/images_const.dart';
import 'package:polynectr/const/color_const.dart';
import 'package:polynectr/util/SizeUtil.dart';
import 'package:polynectr/util/GradientUtil.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _topBar() => SliverAppBar(
        elevation: 1.0,
        pinned: true,
        backgroundColor: blueDeep,
        expandedHeight: 96.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 18.0),
            child: Row(
              children: <Widget>[
                Image.asset(
                  MainImagePath.image_app,
                  width: 40,
                  height: 40,
                ),
                const SizedBox(
                  width: 6.0,
                ),
                const Text(StringConst.APP_NAME,
                    style: TextStyle(
                      color: textBlackLight,
                    ))
              ],
            ),
          ),
          background: Container(
              decoration: BoxDecoration(
                  gradient: GradientUtil.red(
                      begin: AlignmentDirectional.bottomCenter,
                      end: AlignmentDirectional.topCenter))),
          collapseMode: CollapseMode.pin,
        ),
      );

  Widget _menuItem(context, item) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        margin: const EdgeInsets.symmetric(vertical: 1.0),
        decoration: BoxDecoration(
            gradient: GradientUtil.blue(), boxShadow: SHADOW),
        constraints: const BoxConstraints.expand(height: 60.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                item,
                style: const TextStyle(
                    color: textBlackLight, fontSize: TEXT_NORMAL_SIZE),
              ),
            ]
//            Divider(
//              height: 1.0,
//              color: Colors.white,
//            )
//          ],
            ),
      ),
      onTap: () {
//        Navigator.pop(context);
        Navigator.pushNamed(context, "$item");
      },
    );
  }

  Widget _menuList(Menu menu) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _menuItem(context, menu.items?[index]);
      },
      itemCount: menu.items?.length,
    );
  }

  Widget _header(Menu menu) {
    return Ink(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0.0),
        margin: const EdgeInsets.only(bottom: 2.0),
        decoration: BoxDecoration(
          gradient: GradientUtil.red(),
        ),
        constraints: const BoxConstraints.expand(height: 75.0),
        child: Center(
          child: Row(
            children: <Widget>[
              Text(
                '${menu.title} Pages',
                style: const TextStyle(
                    color: textBlack,
                    fontSize: TEXT_NORMAL_SIZE,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _clickMenu(context, Menu menu) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Material(
        color: blueDeep,
        child: Column(
          children: <Widget>[
            _header(menu),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF1F2330), Color(0xFF222044)],
                        begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter)),
                child: _menuList(menu),
              ),
            ),
          ],
        ),
      ),
    );
  }

  LinearGradient _itemGradient(index) {
    var gradient = GradientUtil.red(
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomEnd,
        opacity: 1);
    switch (index % 4) {
      case 0:
        gradient = GradientUtil.bluePurple(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            opacity: 1);
        break;
      case 1:
        gradient = GradientUtil.greenPurple(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            opacity: 1);
        break;
      case 2:
        gradient = GradientUtil.yellowBlue(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            opacity: 1);
        break;
      case 3:
        gradient = GradientUtil.blue(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            opacity: 1);
        break;
    }
    return gradient;
  }

  Widget _gridItem(context, Menu menu, index) => InkWell(
        onTap: () {
          _clickMenu(context, menu);
        },
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              constraints: const BoxConstraints.expand(),
              decoration: BoxDecoration(gradient: _itemGradient(index)),
            ),
            Container(
              constraints: const BoxConstraints.expand(),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      menu.icon,
                      color: textBlackLight,
                      size: 40.0,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      menu.title as String,
                      style: const TextStyle(
                          color: textBlackLight,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );

  Widget _gridView(BuildContext context, List<Menu> list) => SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
            childAspectRatio: 0.8,
            crossAxisCount: 2),
        delegate: SliverChildBuilderDelegate((context, index) {
          var menu = list[index];
          return _gridItem(context, menu, index);
        }, childCount: list.length),
      );

  Widget _streamBuild(context) {
    var controller = MenuStreamController();
    return StreamBuilder(
      builder: (context, shot) {
        return shot.hasData
            ? CustomScrollView(
                slivers: <Widget>[
                  _topBar(),
                  _gridView(context, shot.data as List<Menu>)
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
      stream: controller.menuItems,
    );
  }

  Widget _showAndroid(context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: blueDeep),
      child: Scaffold(
        body: _streamBuild(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeUtil.size = MediaQuery.of(context).size;
    return _showAndroid(context);
  }
}
