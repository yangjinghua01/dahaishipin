
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'common_image.dart';
const List<String> defautimages = [
  "http://hrkj123.com/upload/vod/20210705-1/ac9d6486331aa3c0445033258f134afb.jpg",
  "http://hrkj123.com/upload/vod/20210705-1/3a4c41582b60f00f70976349a4082a41.jpg",
  "http://hrkj123.com/upload/vod/20210705-1/b466afeda99475d097afa32f54062c8e.jpg",
  "http://hrkj123.com/upload/vod/20210705-1/f7f5f87c9c839f53eba7c5447c838d63.jpg"
];
var imgwidth = 750.0;
var imgheight = 424.0;
class CommonSwiper extends StatelessWidget {
  final List<String> images;

  const CommonSwiper({Key? key, this.images = defautimages}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height  =MediaQuery.of(context).size.width/imgwidth*imgheight;
    return Container(
      height: height,
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context,int index){
          return CommonImage(images[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: images.length,
        // control:  new SwiperControl(),
      ),
    );
  }
}
