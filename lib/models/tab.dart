import 'package:flutter/material.dart';

class MyTab {
  final String name;
  final MaterialColor color;
  final IconData icon;

  const MyTab({required this.name, required this.color, required this.icon});
}

enum TabItem { POSTS, ALBUMS, PROFILE }