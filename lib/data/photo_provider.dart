import 'package:flutter/material.dart';
import 'package:image_search/data/api.dart';

class PhotoProvider extends InheritedWidget {
  final PixabayApi api; // 선 언하고

  const PhotoProvider( {
    Key? key,
    required Widget child,
    required this.api,  // 생성자 추가
  }) : super(key: key, child: child);

  //InheritedWidget: 어떤 위젯 트리에도 원하는 데이터를 꽂아서 사용할 수있는 그런 방법 해주는 특별 한 위젯
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }
}
