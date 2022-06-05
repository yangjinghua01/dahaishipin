import 'package:dahaishipin/pages/main/main.dart';
import 'package:flutter/cupertino.dart';

class YRouter{
  static final String inintialRouter =MainScreen.routeName;
  static final Map<String,WidgetBuilder> routes ={
    MainScreen.routeName:(ctx) =>MainScreen(),
    // HYMealScreen.routeName:(ctx)=>HYMealScreen(),
    // HYDetailScreen.routerName:(ctx)=>HYDetailScreen(),
    // HYFilterScreen.routerName:(ctx)=> HYFilterScreen()
  };
  static final RouteFactory generateRoute =(settings){
    return null;
  };
  static final RouteFactory unknowRouter =(settings){
    return null;
  };
}