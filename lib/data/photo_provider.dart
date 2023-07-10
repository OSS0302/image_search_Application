import 'package:flutter/material.dart';
import 'package:image_search/data/api.dart';

class PhotoProvider extends InheritedWidget {
  final PixabayApi api; //  api 추가하고

  const PhotoProvider( {
    Key? key,
    required Widget child,
    required this.api,  // 생성자 추가
  }) : super(key: key, child: child);

  //다른 곳에 제공 할수 있도록 하는 함수
  //ㅐf 통해서 어디서든 PhotoProvider를 얻을 수있도록 해준다 BuildContext 위젯 트리 정보를 가지고있고 가장가까운 context.dependOnInheritedWidgetOfExactType<PhotoProvider>(); 프로바이더를 찾고만약에 데이터를 못 찾는다면 No PixabayApi found in context 를 보여준다.
  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
    context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No PixabayApi found in context');
    return result!;
  }
  //InheritedWidget: 어떤 위젯 트리에도 원하는 데이터를 꽂아서 사용할 수있는 그런 방법 해주는 특별 한 위젯
  @override
  bool updateShouldNotify( PhotoProvider oldWidget) { // 변경되었다는 규칙을 정하는 로직 이고 데이터 이전 상태와 변경후 상태 비교 하는로직
    //covariant는 이름 변경해도 됩니다.  이미 super class 에서 정의가 되어있다.  그래서 타입을 바꿔도 됩니다.
    return oldWidget.api != api; //oldWidget.api 이전상태의 api 하고 현시점의 api 하고 다르면 변경될 것으로 보자

  }
}


