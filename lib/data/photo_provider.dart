import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search/data/api.dart';

import '../model/Photo.dart';

class PhotoProvider extends InheritedWidget {
  final PixabayApi api; //  api 추가하고
  // List<Photo> _photos = []; //InheritedWidget 안에는 불변객체를 가지는 특성를 가진다.  그래서 경고 가나온다.

  //stream controller 생성
  final _photoStreamController =StreamController<List<Photo>>()..add([]); //내부적으로 스트림을 관리하는 _photoStreamController 사용한다.
  Stream<List<Photo>> get photoStream =>_photoStreamController.stream;

   PhotoProvider( { // 변수 가 들어와서 const를 제거한다.
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
  // _photoStreamController 에 데이터를 채울 메서드를 생성
  Future<void> fetch(String query ) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);

  }


  //InheritedWidget: 어떤 위젯 트리에도 원하는 데이터를 꽂아서 사용할 수있는 그런 방법 해주는 특별 한 위젯
  @override
  bool updateShouldNotify( PhotoProvider oldWidget) { // 변경되었다는 규칙을 정하는 로직 이고 데이터 이전 상태와 변경후 상태 비교 하는로직
    //covariant는 이름 변경해도 됩니다.  이미 super class 에서 정의가 되어있다.  그래서 타입을 바꿔도 됩니다.
    return oldWidget.api != api; //oldWidget.api 이전상태의 api 하고 현시점의 api 하고 다르면 변경될 것으로 보자

  }
}


