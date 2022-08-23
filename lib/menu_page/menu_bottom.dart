import 'package:npo_automative_app/home/models/tab.dart';
import 'package:flutter/material.dart';

const Map<TabItem, MyTab> tabs = {
  TabItem.POSTS: const MyTab(name: "Меню", color: Colors.deepPurple, icon: Icons.layers_outlined),
  TabItem.ALBUMS: const MyTab(name: "Отгрузки", color: Colors.deepPurple, icon: Icons.local_shipping_outlined),
  TabItem.PROFILE: const MyTab(name: "Профиль", color: Colors.deepPurple, icon: Icons.account_circle_outlined),
};

class MyBottomNavigation extends StatelessWidget {
  MyBottomNavigation({required this.currentTab, required this.onSelectTab});

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: _colorTabMatching(currentTab),
      selectedFontSize: 13,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentTab.index,
      items: [
        _buildItem(TabItem.POSTS),
        _buildItem(TabItem.ALBUMS),
        _buildItem(TabItem.PROFILE),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index]
      )
    );
  }

  BottomNavigationBarItem _buildItem(TabItem item) {
    return BottomNavigationBarItem(
      icon: Icon(
        _iconTabMatching(item),
        color: _colorTabMatching(item),
        size: 30,
      ),
      label: tabs[item]!.name,
    );
  }

  IconData _iconTabMatching(TabItem item) => tabs[item]!.icon;

  Color _colorTabMatching(TabItem item) {
    return currentTab == item ? tabs[item]!.color : Colors.grey;
  }
}