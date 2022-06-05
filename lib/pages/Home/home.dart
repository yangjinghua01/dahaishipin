import 'package:dahaishipin/UI/tabbarui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "用一部电影来形容你的2019",
          ),
          backgroundColor: Colors.green,
          bottom: TabBar(
            isScrollable: true,
            //是否可以滑动
            //tab文字类型
            unselectedLabelStyle: TextStyle(fontSize: 16),
            //
            labelStyle: TextStyle(fontSize: 24, height: 2),
            labelColor: Colors.white,
            indicator: RoundUnderlineTabIndicator(
                borderSide: BorderSide(width: 3, color: Colors.white),
                width: 23.0,
                widthEqualTitle: false),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 2.0,
            tabs: <Widget>[
              Tab(
                text: "电影",
              ),
              Tab(
                text: "电视",
              ),
              Tab(
                text: "综艺",
              ),
              Tab(
                text: "读书",
              ),
              Tab(
                text: "音乐",
              ),
              Tab(
                text: "同城",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Text("data0"),
            ),
            Center(
              child: Text("data1"),
            ),
            Center(
              child: Text("data"),
            ),
            Center(
              child: Text("data"),
            ),
            Center(
              child: Text("data"),
            ),
            Center(
              child: Text("data"),
            )
          ],
        ),
      ),
    );
  }
}