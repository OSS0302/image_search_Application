
import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/pixabay_api.dart';

void main(){
  test('Pixabay 테이터를 잘 가져와야한다.' ,() async{
  final api = PixabayApi();
  final result = await api.fetch('iphone');

  expect(result.length,20); // 20개인지 확인하는 테스트
  });
}
