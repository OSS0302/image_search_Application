import '../model/Photo.dart';

abstract class PhotoApiRepository{ // 구현을 안하고 추상 메서드
  Future<List<Photo>> fetch(String query);

}