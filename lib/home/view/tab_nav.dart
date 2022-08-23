import 'package:npo_automative_app/home/models/tab.dart';
import 'package:npo_automative_app/menu_page/menu_list.dart';
import 'package:npo_automative_app/profile/profile.dart';
import 'package:npo_automative_app/shipments_complit/shipments_complit.dart';
import 'package:flutter/material.dart';


class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  @override 
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        Widget currentPage;
        if (tabItem == TabItem.POSTS) {
          currentPage = MenyListPage();
        } else if (tabItem == TabItem.ALBUMS) {
          currentPage = ShipmentsComplitPage();
        } else {
          currentPage = ProfilePage();
        }

        return MaterialPageRoute(builder: (context) => currentPage);
      }
    );
  }
}