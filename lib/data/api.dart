// 스트링 커리 지정 async  비동기
Future<List<Photo>> fetch(String query) async {
  final response = await http.get(Uri.parse(
      'https://pixabay.com/api/?key=38081108-118a6127b8642576a388e6c5e&q=$query&image_type=photo&pretty=true'));
  //Response body를 제이슨 디코드변환 사용해야한다.
  Map<String, dynamic> jsonResponse =
  jsonDecode(response.body); //맵형태로 얻는 데이터는 제이슨 형태로 데이터를 얻을수있다
  // 히즈
  Iterable hits = jsonResponse['hits']; // 현 데이터는 맵형태
  return hits.map((e) => Photo.fromJson(e)).toList(); //map data -> 리스트로 변환
}