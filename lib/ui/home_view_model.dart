import 'dart:async';
import 'package:image_search/data/api.dart';
import '../model/Photo.dart';

class HomeViewModel{
  final PixabayApi api;

  //stream controller 생성
  final _photoStreamController =StreamController<List<Photo>>()..add([]); //내부적으로 스트림을 관리하는 _photoStreamController 사용한다.
  Stream<List<Photo>> get photoStream =>_photoStreamController.stream;

  HomeViewModel(this.api); // 생성자

  // _photoStreamController 에 데이터를 채울 메서드를 생성
  Future<void> fetch(String query ) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);

  }
}