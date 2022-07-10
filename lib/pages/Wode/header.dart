import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class LoginHead extends StatelessWidget {
  String userName = '已登录用户名';
   String userImage = 'https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbnovh8jj30hr0hrq3l.jpg';


  LoginHead(this.userName, this.userImage);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
      height: 95,
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Container(
              height: 65,
              width: 65,
              margin: const EdgeInsets.only(right: 15),
              child: CircleAvatar(backgroundImage: NetworkImage(userImage))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Text(userName),
              const Text(
                '查看编辑个人资料',
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
class UnLoginHeard extends StatelessWidget {
  const UnLoginHeard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
      height: 95,
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Container(
            height: 65,
            width: 65,
            margin: const EdgeInsets.only(right: 15),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbgbqv2nj30i20i2wen.jpg'),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'login'),
                    child: Text('登录',),
                  ),
                  Text(' / ',),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'register'),
                    child: Text('注册', ),
                  ),
                ],
              ),
              const Text(
                '登录后可以体验更多',
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
