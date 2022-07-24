import 'package:dahaishipin/UI/normaltitlebar.dart';
import 'package:dahaishipin/UI/tabbarui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DownLoadPage extends StatefulWidget {
  static const String routeName = "/download";

  const DownLoadPage({Key? key}) : super(key: key);

  @override
  _DownLoadPageState createState() => _DownLoadPageState();
}

class _DownLoadPageState extends State<DownLoadPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: content(),
          body: download(),
        ));
  }



//  封装内容部分
  AppBar content() {
    return AppBar(
      title: NormalTitbar("我的下载",(bool flage){
        print(flage);
      }),
      automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        bottom: TabBar(
          labelColor: Colors.black,
          indicator: RoundUnderlineTabIndicator(
              borderSide: BorderSide(width: 3, color: Colors.white),
              width: 29.0,
              widthEqualTitle: false),
          indicatorSize: TabBarIndicatorSize.label,
          padding: EdgeInsets.only(left: 100,right: 100),
          tabs: <Widget>[

            Tab(
              text: "正在下载",
            ),
            Tab(
              text: "已完成",
            ),
          ],
        ));
  }
  TabBarView download(){
    return TabBarView(children: [
      Center(child: Text("da"),),
      Center(child: Text("dadf"),),
    ]
    );
  }
}
