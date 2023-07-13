import 'package:image_search/data/data_source/Pixabay_api.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import '../../domain/model/photo.dart';

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryImpl(this.api);


  @override
  Future <Result<List<Photo>>> fetch(String query) async {

    final result = await api.fetch(query);
    // 에러일수도 있고 아닐수도있다.

    return result.map((e) => Photo.fromJson(e)).toList(); //map data -> 리스트로 변환
  }
}
