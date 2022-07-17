import 'package:dahaishipin/common/common_image.dart';
import 'package:dahaishipin/common/common_swipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Movies extends StatefulWidget {
  late List<String>list = [
    "1233444",
    "adfdsafdsa",
    "adsffdas",
    "123wwer",
  ];
   Movies({Key? key}) : super(key: key);
  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  ScrollController _scrollController = ScrollController();
  void initState() {
    super.initState();
    setState(() {

    });
    _scrollController
      .addListener(() {
        //向上滚动
        if (_scrollController.position.pixels > _scrollController.position.maxScrollExtent - 20) {
          print("加载更多");
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        print("刷新操作");
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            CommonSwiper(),
            Row(
              children: [
                Icon(
                  Icons.voice_chat,
                  color: Colors.green,
                ),
                Text(
                  "一起看新剧",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, //设置每行的显示个数
                  crossAxisSpacing: 7, //设置交叉轴间距
                  childAspectRatio: 1, //设置主轴间距
                  mainAxisSpacing: 1 //设置行高
                  ),
              children: List.generate(4, (index) {
                return Moviesitem(widget.list[index],widget.list[index]);
              }),
            ),
          ],
        ),
      ),
    );
  }

  // https://pic4.iqiyipic.com/image/20220526/71/81/a_100480946_m_601_m1_260_360.jpg
  Widget Moviesitem(String title,String info) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.green,
            child: Image(
              image: NetworkImage(
                  'https://pic4.iqiyipic.com/image/20220526/71/81/a_100480946_m_601_m1_260_360.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              info,
              style: TextStyle(color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
