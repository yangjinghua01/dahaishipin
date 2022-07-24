import 'package:dahaishipin/UI/normaltitlebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  static const String routeName = "/history";

  HistoryPage();

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: NormalTitbar("历史",(bool flag){
          print(flag);
        }),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Expanded(
            child: ListView(
              children: List.generate(24, (index) {
                return buildListtitle(
                    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F4k%2Fs%2F02%2F2109242306111155-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1661183399&t=4598698a66165080ead396c7a1b96eca",
                    "吞噬星空",
                    "剩余22222", () {
                  print("跳转传参");
                });
              }),
            ),
          )
        ],
      ),
    );
  }

  Widget buildListtitle(String url, String title, String contont, void Function() click) {
    return GestureDetector(
      onTap: click,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 15, right: 20, bottom: 15),
              child: Container(
                height: 100,
                width: 67,
                child: Image.network(
                  url,
                  fit: BoxFit.fill,
                ),
              )),
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 19, bottom: 29),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 14),
                  )),
              Text(
                contont,
                style: TextStyle(fontSize: 12, color: Colors.blue),
              )
            ],
          ),
        ],
      ),
    );
  }
}
