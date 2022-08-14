import 'package:flutter/material.dart';
import 'package:npo_automative_app/pages/meny.dart';
import 'package:npo_automative_app/pages/shipments_complit.dart';
import 'package:npo_automative_app/pages/profile.dart';
import '../../models/tab.dart';


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