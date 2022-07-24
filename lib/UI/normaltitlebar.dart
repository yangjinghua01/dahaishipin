import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NormalTitbar extends StatefulWidget {
  late String? title;
  late  bool flag =false;
  final void Function(bool) callback;
  NormalTitbar(this.title, this.callback);

  @override
  State<NormalTitbar> createState() => _NormalTitbarState();
}

class _NormalTitbarState extends State<NormalTitbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.chevron_left,
                size: 39,
              )),
        ),
        Center(
          child: Text(widget.title!),
        ),
        Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
                onTap: () {
                 setState(() {
                   widget.flag =!widget.flag;
                   widget.callback(widget.flag);
                 });
                },
                child: Text("编辑")))
      ],
    );

  }
}


