import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DeviceSearchPage extends StatefulWidget {
  static const String routeName = "/search";
  final List<String> contents = [];
  late  List<String> hisArray = [];

  DeviceSearchPage();

  @override
  State<StatefulWidget> createState() {
    return _DeviceSearchPageState();
  }
}

class _DeviceSearchPageState extends State<DeviceSearchPage> {
  String searchValue = "";
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String inputvalue = "搜索";
    double statusHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(1, statusHeight + 12, 16, 16),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(child: Icon(Icons.chevron_left,size: 37,),onTap: (){
                  Navigator.pop(context);
                },),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 36,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(36)),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 6),
                        Icon(Icons.search),
                        SizedBox(width: 6),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            decoration: new InputDecoration(
                                hintText: '设备搜索', border: InputBorder.none),
                            style: TextStyle(fontSize: 12),
                            onChanged: (value) {
                              setState(() {
                                searchValue = value;
                                print("变化"+value);
                              });
                            },
                            controller: _controller,
                          ),
                        ),
                        searchValue != ""
                            ? InkWell(
                          onTap: () {
                            setState(() {
                              searchValue = "";
                            });
                            _controller.text=searchValue;
                          },
                          child: Icon(Icons.close, size: 14),
                        )
                            : Container(),
                        SizedBox(width: 6)
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    print("搜索");
                  },
                  child: Text(inputvalue),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            searchValue == ""
                ? getHistoryWidget()
                : getSearchResultWidget()
          ],
        ),
      ),
    );
  }

  ///搜索结果
  Widget getSearchResultWidget() {
    List<String> results = [];
    List.generate(widget.contents.length, (index) {
      if (widget.contents[index].contains(searchValue)) {
        results.add(widget.contents[index]);
      }
    });
    return SingleChildScrollView(
      child: Column(
        children: List.generate(results.length, (index) {
          return InkWell(
              onTap: () {
                _controller.text = results[index];
              },
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey))),
                child: Text(results[index]),
              ));
        }),
      ),
    );
  }

  ///搜索历史
  Widget getHistoryWidget() {
    return Column(
      children: <Widget>[
        Container(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "搜索历史",
                  style: TextStyle(fontSize: 12),
                ),
                InkWell(
                  onTap: showClearDialog,
                  child: Icon(Icons.delete_forever,
                      color: Colors.redAccent, size: 20),
                )
              ],
            )),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          child: Wrap(
            spacing: 3,
            runSpacing: 3,
            children: List.generate(widget.hisArray.length, (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    searchValue = widget.hisArray[index];
                  });
                  _controller.text = searchValue;
                },
                child: Chip(
                  backgroundColor: Colors.black12,
                  label:
                  Text(widget.hisArray[index], style:TextStyle(fontSize: 12)),
                ),
              );
            }),
          ),
        )
      ],
    );
  }

  showClearDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(""),
            content: Text("确认清除所有搜索记录吗？"),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("取消"),
                onPressed: () {
                  Navigator.pop(context);
                  print("取消");
                },
              ),
              CupertinoDialogAction(
                child: Text("确定"),
                onPressed: () {
                  setState(() {
                    widget.hisArray = [];
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}