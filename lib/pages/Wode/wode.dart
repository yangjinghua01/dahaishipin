import 'dart:ffi';

import 'package:dahaishipin/pages/Wode/header.dart';
import 'package:dahaishipin/pages/download/download.dart';
import 'package:dahaishipin/pages/lookhistory/history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wode extends StatelessWidget {
  const Wode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40),
      child: Column(
        children: [
          UnLoginHeard(),
          buildListtitle("观看历史", Icons.update, () {
            Navigator.of(context).pushNamed(HistoryPage.routeName);
          }),
          buildListtitle("我的收藏", Icons.favorite_outlined, () {
            print(1);
          }),
          buildListtitle("我的下载", Icons.cloud_download_outlined, () {
            Navigator.of(context).pushNamed(DownLoadPage.routeName);
          }),
          buildListtitle("上传视频", Icons.cloud_upload_outlined, () {
            print(1);
          }),
          buildListtitle("意见反馈", Icons.data_usage_sharp, () {
            print(1);
          }),
          buildListtitle("设置", Icons.settings, () {
            print(1);
          }),
        ],
      ),
    );
  }
}
Widget buildListtitle(String title, IconData icon, void Function() click){
  return  GestureDetector(
    onTap: click,
    child: ListTile(
      title: Row(children: [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(
            icon,
            color: Colors.blueAccent,
            size: 34,
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 18),
        ),
      ],),
      trailing: Icon(
        Icons.chevron_right,
        size: 34,
      ),
    ),
  );
}
