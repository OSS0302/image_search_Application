import 'dart:convert';
import 'package:image_search/data/photo_api_repository.dart';

import '../model/Photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi implements PhotoApiRepository {
// 스트링 커리 지정 async  비동기
  // pixabay 페이지 Url
  final baseUrl = 'https://pixabay.com/api/'; // Url 중에 변하는건 key 이기때문에  변하지 않는 url 'https://pixabay.com/api/'를 분리했다.
  // static const baseUrl = 'https://pixabay.com/api/'; // 변하지 않는값이라서  final이  static const 사용할 수도있다.
  //pixabay key
  final key = '38081108-118a6127b8642576a388e6c5e&q';


  @override
  Future<List<Photo>> fetch(String query,{http.Client? client}) async {
    client ??= http.Client(); // 클라이언트 널일때 http.Client()로 초기화를 하겠다.

    final response = await client.get(Uri.parse(
        '$baseUrl?key=$key=$query&image_type=photo&pretty=true'));
    //Response body를 제이슨 디코드변환 사용해야한다.
    Map<String, dynamic> jsonResponse = jsonDecode(response.body); //맵형태로 얻는 데이터는 제이슨 형태로 데이터를 얻을수있다
    // 히즈
    Iterable hits = jsonResponse['hits']; // 현 데이터는 맵형태
    return hits.map((e) => Photo.fromJson(e)).toList(); //map data -> 리스트로 변환
  }
}
