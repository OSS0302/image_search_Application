import 'package:image_search/data/data_source/Pixabay_api.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import '../../domain/model/photo.dart';

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryImpl(this.api);

  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    final Result<Iterable> result = await api.fetch(query);
    // 검사하기
    return result.when(// 하나라도 사용안하면 오류가난다. 개발자 실수를 줄인다.
        success: (iterable) { //성공시
          return Result.success(iterable.map((e) => Photo.fromJson(e)).toList()); //map data -> 리스트로 변환
        },
        error: (message) { // 실패시
          return Result.error(message);
        });
    // 에러일수도 있고 아닐수도있다.


  }
}
