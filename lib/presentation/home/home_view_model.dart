import 'dart:async';
import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/model/photo.dart';

class HomeViewModel with ChangeNotifier{
  final PhotoApiRepository repository;

  List<Photo> _photos =[]; //빈 리스트 생성

 // getter 생성 :내부에서 홈 뷰모델을 고치고 외부에서 _photos를 고치지 못하도록 get 를 사용한다.
  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos); //수정 못하는리스트: UnmodifiableListView

  HomeViewModel(this.repository); // 생성자

  // _photoStreamController 에 데이터를 채울 메서드를 생성
  Future<void> fetch(String query ) async {
    final result = await repository.fetch(query);
    _photos =result; // 갱신한다.
    notifyListeners(); // 감시하는 곳에 알림을 주는 기능

  }
}