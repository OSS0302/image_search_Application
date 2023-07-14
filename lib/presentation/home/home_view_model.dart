import 'dart:async';
import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/presentation/home/home_ui_event.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  List<Photo> _photos = []; //빈 리스트 생성

  // getter 생성 :내부에서 홈 뷰모델을 고치고 외부에서 _photos를 고치지 못하도록 get 를 사용한다.
  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos); //수정 못하는리스트: UnmodifiableListView

  bool _isLoading = false;


  bool get isLoading => _isLoading; //getter 를 사용하면 외부에서 사용할수없다 .

  // 사용자 한테 에러메시지 를 보여주기위해서 컨트롤러 생성
  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get EventStream => _eventController.stream;



  HomeViewModel(this.repository); // 생성자

  // _photoStreamController 에 데이터를 채울 메서드를 생성
  Future<void> fetch(String query) async {
    _isLoading = true;
    final Result<List<Photo>> result = await repository.fetch(query);
    // 검사하기
    result.when(success: (photos) {
        _photos = photos; // 갱신한다.
    }, error: (message) {
        _eventController.add(HomeUiEvent.showSnackBar(message));
      }
    );
    _isLoading=false;
  }
}
