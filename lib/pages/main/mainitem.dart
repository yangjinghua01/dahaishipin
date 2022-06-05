import 'package:dahaishipin/pages/Home/home.dart';
import 'package:dahaishipin/pages/Paihang/paihang.dart';
import 'package:dahaishipin/pages/Tuiguang/tuiguang.dart';
import 'package:dahaishipin/pages/Wode/wode.dart';
import 'package:dahaishipin/pages/Zhaopian/zhaopian.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<Widget> pages = [
  HomeScreen(),
  Paihang(),
  Zhaopian(),
  Tuiguang(),
  Wode()
];
final List<BottomNavigationBarItem> items =[
  BottomNavigationBarItem(
      title: Text("首页"),
      icon: Icon(Icons.home),
  ),
  BottomNavigationBarItem(
      title: Text("排行"),
      icon: Icon(Icons.star),
  ),
  BottomNavigationBarItem(
    title: Text("找片"),
    icon: Icon(Icons.star),
  ),
  BottomNavigationBarItem(
    title: Text("推广"),
    icon: Icon(Icons.star),
  ),
  BottomNavigationBarItem(
    title: Text("我的"),
    icon: Icon(Icons.star),
  )
];