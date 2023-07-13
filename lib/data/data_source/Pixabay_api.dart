import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:image_search/data/data_source/result.dart';

class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '38081108-118a6127b8642576a388e6c5e&q';

  Future<Result<Iterable>> fetch(String query) async {
    try {
      final response = await client.get(Uri.parse(
          '$baseUrl?key=$key=$query&image_type=photo&pretty=true'));

      Map<String, dynamic> jsonResponse = jsonDecode(
          response.body); //맵형태로 얻는 데이터는 제이슨 형태로 데이터를 얻을수있다
      // 히즈
      Iterable hits = jsonResponse['hits']; // 현 데이터는 맵형태
      return Result.success(hits); //성공했을때에는   히즈를 담아서 넘겨준다.
    } catch (e){ //Iterable 빈거를 리턴 사용해도 되고 result class 만들어서  성공 실패 객체 를 만들어서 리턴한다.
      return const Result.error('네트워크 에러다.');
    }
  }
}