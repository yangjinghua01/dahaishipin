import 'package:dahaishipin/common/common_image.dart';
import 'package:dahaishipin/common/common_swipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Movies extends StatelessWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                crossAxisCount: 3, //设置每行的显示个数
                crossAxisSpacing: 1, //设置交叉轴间距
                childAspectRatio: 1, //设置主轴间距
                mainAxisSpacing: 18 //设置行高
                ),
            children: List.generate(100, (index) {
              return Moviesitem();
            }),
          ),
        ],
      ),
    );
  }

  Widget Moviesitem() {
    return Column(
      children: [
        CommonImage(
          "https://pic4.iqiyipic.com/image/20220526/71/81/a_100480946_m_601_m1_260_360.jpg",
          width: double.maxFinite,
          height: 120,
        ),
      ],
    );
  }
}
