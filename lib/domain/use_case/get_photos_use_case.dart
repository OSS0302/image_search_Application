import 'dart:math';

import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';

class GetPhotosUseCase{
  final PhotoApiRepository repository;

  GetPhotosUseCase(this.repository);

  // 실행할 메서드 생성
  Future<Result<List<Photo>>> call(String query) async{ //fetch 를 오래동안 작동해서 Future 추가 execute -> call 바꾸어서 사용할 수있다.
    final  result = await repository.fetch(query);
     // 성공하면 photo를 3개만 보여주고 실패하면 메시지를 보여줘라
    return result.when(success: (photos){
      return Result.success( photos.sublist(0,min(3,photos.length))); //
    }, error: (message){
      return Result.error(message);
    });


  }
}