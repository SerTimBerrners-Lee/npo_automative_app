import 'package:flutter/material.dart';
import 'package:npo_automative_app/block/auth_block.dart';
import 'package:npo_automative_app/models/tab.dart';
import 'package:npo_automative_app/pages/home/bottom_navigation.dart';
import 'package:npo_automative_app/pages/home/tab_nav.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthUserBloc authUserBloc = AuthUserBloc();

  final _navigatorKeys = {
    TabItem.POSTS: GlobalKey<NavigatorState>(),
    TabItem.ALBUMS: GlobalKey<NavigatorState>(),
    TabItem.TODOS: GlobalKey<NavigatorState>(),
  };

  var _currentTab = TabItem.POSTS;

  void _selectTab(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {
  print('sdfdsf $authUserBloc.isAuth');
    return WillPopScope(
      onWillPop: () async {
        if (_currentTab != TabItem.POSTS) {
          if (_currentTab == TabItem.TODOS) {
            _selectTab(TabItem.ALBUMS);
          } else {
            _selectTab(TabItem.POSTS);
          }
          return false;
        } else {
          return true;
        }

      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.POSTS),
          _buildOffstageNavigator(TabItem.ALBUMS),
          _buildOffstageNavigator(TabItem.TODOS),
        ]),
        bottomNavigationBar: MyBottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),);
  }
  
  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }

}


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text("Home page")),
  //     body: Center(
  //       child: AnimatedSwitcher(
  //         duration: const Duration(milliseconds: 900),
  //         reverseDuration: const Duration(milliseconds: 0),
  //         child: Text(
  //           "$_counter",
  //           key: ValueKey<int>(_counter),
  //           textAlign: TextAlign.center,
  //           style: Theme.of(context).textTheme.headline3,
  //         )
  //       ),
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       child: Icon(Icons.animation),
  //       onPressed: () {
  //         setState(() {
  //           _counter++;
  //         });
  //       }
  //     ),
  //   );
  // }
