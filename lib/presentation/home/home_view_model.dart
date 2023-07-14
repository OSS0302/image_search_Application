import 'dart:async';
import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/presentation/home/home_state.dart';
import 'package:image_search/presentation/home/home_ui_event.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;
  
  HomeState _state = HomeState([], false);

  HomeState get state => _state; // 생성자 추가


  // 사용자 한테 에러메시지 를 보여주기위해서 컨트롤러 생성
  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get EventStream => _eventController.stream;



  HomeViewModel(this.repository); // 생성자

  // _photoStreamController 에 데이터를 채울 메서드를 생성
  Future<void> fetch(String query) async {
    _state = state.copy(isLoading: true); // 기존 state 에서 카피한 로딩이 true 로 한다.
    state.isLoading = true;
    notifyListeners(); // 상태 감지
    final Result<List<Photo>> result = await repository.fetch(query);
    // 검사하기
    result.when(success: (photos) {
      _state = state.copy(photos: photos); // 갱신한다.
      notifyListeners(); // 상태감지
    }, error: (message) {
        _eventController.add(HomeUiEvent.showSnackBar(message));
      }
    );
    _state = state.copy(isLoading: false);
    notifyListeners(); // 상태감지
  }
}
