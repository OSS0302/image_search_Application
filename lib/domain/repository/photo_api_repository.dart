import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/model/photo.dart';

abstract class PhotoApiRepository{ // 구현을 안하고 추상 메서드
  Future <Result<List<Photo>>> fetch(String query);

}