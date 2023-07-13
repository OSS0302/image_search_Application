import 'package:flutter/material.dart';
import 'package:image_search/domain/model/photo.dart';

import '../../../data/repository/photo_api_repository_impl.dart';

class PhotoWidget extends StatelessWidget {
  final Photo photo; // 포토 필드 전역변수 선언 포토기반 으로 동작 하기위해서

  const PhotoWidget({Key? key,
    required this.photo}) // api 샹성자 추
      : super(key: key); // this.photo 추가
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              photo.previewURL),
        ),
      ),
    );
  }
}
