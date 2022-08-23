import 'package:npo_automative_app/home/models/tab.dart';
import 'package:npo_automative_app/home/view/bottom_navigation.dart';
import 'package:npo_automative_app/home/view/tab_nav.dart';
import 'package:flutter/material.dart';


// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   static Route<void> route() {
//     return MaterialPageRoute<void>(builder: (_) => const HomePage());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home')),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Builder(
//               builder: (context) {
//                 final userId = context.select(
//                   (AuthenticationBloc bloc) => bloc.state.user.id,
//                 );
//                 return Text('UserID: $userId');
//               },
//             ),
//             ElevatedButton(
//               child: const Text('Logout'),
//               onPressed: () {
//                 context
//                     .read<AuthenticationBloc>()
//                     .add(AuthenticationLogoutRequested());
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _navigatorKeys = {
    TabItem.POSTS: GlobalKey<NavigatorState>(),
    TabItem.ALBUMS: GlobalKey<NavigatorState>(),
    TabItem.PROFILE: GlobalKey<NavigatorState>(),
  };

  var _currentTab = TabItem.POSTS;

  void _selectTab(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentTab != TabItem.POSTS) {
          if (_currentTab == TabItem.PROFILE) {
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
          _buildOffstageNavigator(TabItem.PROFILE),
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