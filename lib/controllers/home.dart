import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:npo_automative_app/models/tab.dart';

// Пока отмена - незнаю как с этим работать ....

class HomeController extends ControllerMVC {
  static HomeController _this = HomeController._();
  static HomeController get controller => _this;

  factory HomeController() { 
    if (_this == null) _this = HomeController._();
    return _this;
  }

  HomeController._();

  final _navigatorKeys = {
    TabItem.POSTS: GlobalKey<NavigatorState>(),
    TabItem.ALBUMS: GlobalKey<NavigatorState>(),
    TabItem.TODOS: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, GlobalKey> get navigatorKeys => _navigatorKeys;
  var _currentTab = TabItem.POSTS;
  TabItem get currentTab => _currentTab;

  void selectTab(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }
}
