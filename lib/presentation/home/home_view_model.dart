import 'dart:async';
import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/domain/use_case/get_photos_use_case.dart';
import 'package:image_search/presentation/home/home_state.dart';
import 'package:image_search/presentation/home/home_ui_event.dart';

class HomeViewModel with ChangeNotifier {
  final GetPhotosUseCase getPhotosUseCase;
  
  HomeState _state = HomeState([], false);

  HomeState get state => _state; // 생성자 추가


  // 사용자 한테 에러메시지 를 보여주기위해서 컨트롤러 생성
  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get EventStream => _eventController.stream;



  HomeViewModel(this.getPhotosUseCase); // 생성자

  //voidCallback? callback; // funtion 기능이다.

  // _photoStreamController 에 데이터를 채울 메서드를 생성
  Future<void> fetch(String query) async {
    //callback(); // call 생략가능하다callback.call();

    _state = state.copyWith(isLoading: true); // 기존 state 에서 카피한 로딩이 true 로 한다.
    notifyListeners(); // 상태 감지

      final Result<List<Photo>> result = await getPhotosUseCase(query); // call 는 생략가능해서 getPhotosUseCase.call(qurey);
    // 검사하기
    result.when(success: (photos) {
      _state = state.copyWith(photos: photos); // 갱신한다.
      notifyListeners(); // 상태감지
    }, error: (message) {
        _eventController.add(HomeUiEvent.showSnackBar(message));
      }
    );
    _state = state.copyWith(isLoading: false) ;
    notifyListeners(); // 상태감지
  }
}
