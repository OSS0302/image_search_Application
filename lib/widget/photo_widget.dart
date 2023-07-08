import 'package:flutter/material.dart';
import 'package:image_search/model/Photo.dart';

class PhotoWidget extends StatelessWidget {
  final Photo photo; // 포토 필드 전역변수 선언 포토기반 으로 동작 하기위해서

  const PhotoWidget({Key? key, required this.photo})
      : super(key: key); // this.photo 추가
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://cdnimg.melon.co.kr/cm2/artistcrop/images/002/61/143/261143_20210325180240_org.jpg?61e575e8653e5920470a38d1482d7312/melon/optimize/90'))),
    );
  }
}
