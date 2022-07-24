import 'package:dahaishipin/UI/tabbarui.dart';
import 'package:dahaishipin/UI/titlebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController mTabController;
  PageController mPageController = PageController(initialPage: 0);
  List<String> tabList = ['热播榜', '飙升榜','热搜榜','新片榜', '电视剧', "电影", '综艺', '动漫'];
  var currentPage = 0;
  var isPageCanChanged = true;

  @override
  void initState() {
    super.initState();
    mTabController = TabController(
      length: tabList.length,
      vsync: this,
    );
    mTabController.addListener(() {
      if (mTabController.indexIsChanging) {
        print((mTabController.index).toString()+"回调网络方法");
        onPageChange(mTabController.index, p: mPageController);
      }
    });
  }

  onPageChange(int index, {PageController? p, TabController? t}) async {
    if (p != null) {
      isPageCanChanged = false;
      await mPageController.animateToPage(index,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease); //等待pageview切换完毕,再释放pageivew监听
      isPageCanChanged = true;
    } else {
      mTabController.animateTo(index);
    }
  }

  @override
  void dispose() {
    super.dispose();
    mTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBars(
        appBarHeight: 200,
        child: Container(
            height: 150,
            child:
            Image.network(
              "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000.com%2F%2Fpic%2F1%2Fa1%2Fed8fc0616a.jpg&refer=http%3A%2F%2Fpic1.win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1661246776&t=2891f9c9d91ac266604fb661c0f62a2d",
              fit: BoxFit.fill,)
        ),),
      body: Column(
        children: <Widget>[
          Container(
            color: Color(0xfff4f5f6),
            height: 38.0,
            child: TabBar(
              isScrollable: true,
              controller: mTabController,
              labelColor: Colors.black,
              indicator: RoundUnderlineTabIndicator(
                  borderSide: BorderSide(width: 3,color: Colors.green),
                  width: 29.0,
                  widthEqualTitle: false
              ),
              unselectedLabelColor: Color(0xff666666),
              labelStyle: TextStyle(fontSize: 16.0),
              tabs: tabList.map((item) {
                return Tab(
                  text: item,
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: tabList.length,
              onPageChanged: (index) {
                if (isPageCanChanged) {
                  onPageChange(index);
                }
              },
              controller: mPageController,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Text(
                    tabList[index],
                    textScaleFactor: 2,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}