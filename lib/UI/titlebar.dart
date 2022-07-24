import 'package:flutter/material.dart';

class CustomBars extends StatelessWidget implements PreferredSizeWidget{
  final bool? back;
  final Widget? child;
  final double? appBarHeight;
  final Color? appBarBackgroupColor;
  final EdgeInsetsGeometry? appBarPadding;
  final bool? spaceBar;
  final Color? spaceBarBackgroupColor;
  final Decoration? decoration;
  /// * back 是否显示返回按钮
  /// * child 主内容区
  /// * appBar 头部导航
  /// * appBarHeight 头部导航高度
  /// * appBarBackgroupColor 底色
  /// * appBarPadding 内边距
  /// * spaceBar 状态栏是否占用高度
  /// * spaceBarBackgroupColor 占用的高度底色
  const CustomBars({
    Key? key,
    this.back=true,
    this.child,
    this.appBarHeight=40.0,
    this.appBarBackgroupColor=Colors.transparent,
    this.appBarPadding=const EdgeInsets.fromLTRB(5, 0, 5, 0),
    this.spaceBar=true,
    this.spaceBarBackgroupColor=Colors.transparent,
    this.decoration
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(200);

  List<Widget> renderAppBarChildren(BuildContext context){
    late List<Widget> children =[];
    if(back!){

    }
    if(child != null){
      children.add(
          Expanded(child: child!)
      );
    }
    return children;
  }

  List<Widget> renderChildren(BuildContext context){
    final double topHeihgt = MediaQuery.of(context).padding.top;
    late List<Widget> reslut=[];
    if(spaceBar!){
      reslut.add(
          Container(
            padding: EdgeInsets.only(top: topHeihgt),
            color: spaceBarBackgroupColor,
          )
      );
    }
    if(child != null){
      reslut.add(
          Container(
            color: appBarBackgroupColor,
            height: appBarHeight,
            padding: appBarPadding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: renderAppBarChildren(context),
            ),
          )
      );
    }
    return reslut;
  }

  @override
  Widget build(BuildContext context) {
    late double allHeihgt = 0;
    if(spaceBar!){
      allHeihgt = allHeihgt+MediaQuery.of(context).padding.top;
    }
    if(child != null){
      allHeihgt =allHeihgt+appBarHeight!;
    }
    return Container(
      height: allHeihgt,
      decoration:decoration??null,
      child: Column(
          children: renderChildren(context)
      ),
    );
  }
}