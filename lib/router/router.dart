import 'package:dahaishipin/pages/Home/pages/movies/historyseach.dart';
import 'package:dahaishipin/pages/download/download.dart';
import 'package:dahaishipin/pages/lookhistory/history.dart';
import 'package:dahaishipin/pages/main/main.dart';
import 'package:flutter/cupertino.dart';

class YRouter{
  static final String inintialRouter =MainScreen.routeName;
  static final Map<String,WidgetBuilder> routes ={
    MainScreen.routeName:(ctx) =>MainScreen(),
    DeviceSearchPage.routeName:(ctx)=>DeviceSearchPage(),
    HistoryPage.routeName:(ctx)=>HistoryPage(),
    DownLoadPage.routeName:(ctx)=>DownLoadPage(),
  };
  static final RouteFactory generateRoute =(settings){
    return null;
  };
  static final RouteFactory unknowRouter =(settings){
    return null;
  };
}