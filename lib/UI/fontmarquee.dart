import 'dart:async';

import 'package:flutter/material.dart';

//文字滚动效果
class FontMarquee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FontMarqueeState();
  }
}

class FontMarqueeState extends State<FontMarquee> with WidgetsBindingObserver  {
  late GlobalKey _myKey = new GlobalKey();
  late ScrollController _controller;
  int index=0;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    //来监听 节点是否build完成
    WidgetsBinding? widgetsBinding=WidgetsBinding.instance;
    widgetsBinding?.addPostFrameCallback((callback){
      Timer.periodic(new Duration(seconds: 5), (timer){
        index+=_myKey.currentContext!.size!.height.toInt();
        _controller.animateTo((index).toDouble(), duration: new Duration(seconds: 2), curve: Curves.easeOutSine);
        //滚动到底部从头开始
        if((index-_myKey.currentContext!.size!.height.toInt()).toDouble()>_controller.position.maxScrollExtent){
          _controller.jumpTo(_controller.position.minScrollExtent);
          index=0;
        }
      });
    });
    _controller = new ScrollController(initialScrollOffset: 0);
    /*   _controller.addListener(() {
      print(_controller.offset);
    });*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: _myKey,
        //禁止手动滑动
        physics: new NeverScrollableScrollPhysics(),
        itemCount: 5,
        //item固定高度
        scrollDirection: Axis.vertical,
        controller: _controller,
        itemBuilder: (context, index) {
          return Container(
            child: Text("【猎毒人】吕云鹏线？" + index.toString(),style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
          );
        });
  }

}