import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mainitem.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "/";
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: items,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor:Colors.grey,
        selectedItemColor: Colors.green,
        onTap: ((index){
          setState(() {
            _currentIndex = index;
          });
        }),
      ),
    );
  }
}
