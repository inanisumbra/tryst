
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:polynectr/item/menu.dart';
import 'package:polynectr/const/images_const.dart';
import 'package:polynectr/const/page_str_const.dart';

const _MENU_STRINGS = [
  {'title': "Sign Up", 'items': SIGN_UP_PAGES},
  {'title': "Navigation", 'items': NAVIGATION_PAGES},
  {'title': "Profile", 'items': PROFILE_PAGES},
  {'title': "Feed", 'items': FEED_PAGES},
  {'title': "Chat", 'items': CHAT_PAGES},
  {'title': "Shoppig", 'items': SHOPPING_PAGES},
];
const _MENU_COLORS = [
  0xff050505,
  0xffc8c4bd,
  0xffc7d8f4,
  0xff7f5741,
  0xff261d33,
  0xff2a8ccf,
  0xffe19b6b,
  0xffe19b6b,
  0xffddcec2,
  0xff261d33,
];
const _MENU_ICONS = [
  Icons.airplanemode_active,
  Icons.location_on,
  Icons.account_box,
  Icons.feedback,
  Icons.chat,
  Icons.shopping_cart,
];
const _IMAGE_PATHS = [
  MainImagePath.image_sign_up,
  MainImagePath.image_navigation,
  MainImagePath.image_profile,
  MainImagePath.image_feed,
  MainImagePath.image_chat,
  MainImagePath.image_shopping,
];

class MenuStreamController {
  final controller = StreamController<List<Menu>>();

  Stream<List<Menu>> get menuItems => controller.stream;

  MenuStreamController({List<Menu>? menus}) {
    controller.add(menus ?? _defaultMenus());
  }

  static String _title(index) {
    return _MENU_STRINGS[index % _MENU_STRINGS.length]['title'] as String;
  }

  static List<String> _items(index) {
    var listIndex = index % _MENU_STRINGS.length as int; 
    return _MENU_STRINGS[listIndex]['items'] as List<String>;
  }

  List<Menu> _defaultMenus() {
    var list = <Menu>[];
    for (int i = 0; i < _MENU_STRINGS.length; ++i) {
      list.add(Menu(
          title: _title(i),
          icon: _MENU_ICONS[i],
          menuColor: Color(_MENU_COLORS[i]),
          image: _IMAGE_PATHS[i],
          items: _items(i)));
    }
    return list;
  }
}
