import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/data/pixabay_api.dart';
import 'package:image_search/model/Photo.dart';
import 'package:image_search/ui/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
void main(){
  test('Stream이 잘 동작해야한다',()async{
    final viewModel = HomeViewModel(FakePhotoApiRepository()); // 객체 생성
    //PixabayApi fetch기능  가 잘 못되면 HomeViewModel 도 사용할 수없다  의존성

    await viewModel.fetch('apple');
    await viewModel.fetch('iphone');

    final  List<Photo> result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(
    viewModel.photoStream,
      emitsInOrder([
        equals([]),
        equals(result), // 포토 스트림을 통해서 fakeJson.map((e) => Photo.fromJson(e)).toList() 가 들어올지 예상한다.
        equals(result), // 포토 스트림을 통해서 fakeJson.map((e) => Photo.fromJson(e)).toList() 가 들어올지 예상한다.

      ]),
    );
  });
}

//가짜 데이터 만들기
class FakePhotoApiRepository extends PhotoApiRepository{
  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500)); //0.5초 대기

      return fakeJson.map((e) => Photo.fromJson(e)).toList(); //
  }
}
List<Map<String,dynamic>> fakeJson =[ //map 이니까 두개의 데이터를 넣었다.
  {
    "id": 634572,
    "pageURL": "https://pixabay.com/photos/apples-fruits-red-ripe-vitamins-634572/",
    "type": "photo",
    "tags": "apples, fruits, red",
    "previewURL": "https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_150.jpg",
    "previewWidth": 100,
    "previewHeight": 150,
    "webformatURL": "https://pixabay.com/get/gdfecdf42a6c38ba96a308f9b15957db1b9b6764a76500cd83c42077834131dea6bf037eeecfc7008a9b14bd79d54f30a_640.jpg",
    "webformatWidth": 427,
    "webformatHeight": 640,
    "largeImageURL": "https://pixabay.com/get/g752447b687d2de39014b1331927e0163077e64030e5663b5385606b357961848aeb04db789262f050abd73c4eef39248b0ad433b3254eb9c0b3a1e7b20f22cd7_1280.jpg",
    "imageWidth": 3345,
    "imageHeight": 5017,
    "imageSize": 811238,
    "views": 516348,
    "downloads": 310867,
    "collections": 1308,
    "likes": 2394,
    "comments": 199,
    "user_id": 752536,
    "user": "Desertrose7",
    "userImageURL": "https://cdn.pixabay.com/user/2016/03/14/13-25-18-933_250x250.jpg"
  },{
    "id": 1868496,
    "pageURL": "https://pixabay.com/photos/apple-computer-desk-workspace-1868496/",
    "type": "photo",
    "tags": "apple, computer, desk",
    "previewURL": "https://cdn.pixabay.com/photo/2016/11/29/08/41/apple-1868496_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL": "https://pixabay.com/get/g1e396b9f54fed5fdb0b5e52ed0ae6d2bbf08b29b99011539c7bc7b7d798c93eab7948a9ff6bbc8f0a9db09d68ec94dcd317894dce835ad3467d6309e26b9171a_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL": "https://pixabay.com/get/gcb4eb390cd42fc1e1f9887705762c3d1f099611fcde20178a9add3fb9745d1001cefcf98bd667ccdb9e81a596b3b04580d0000db66ebfee0d384aee7b06fc8de_1280.jpg",
    "imageWidth": 5184,
    "imageHeight": 3456,
    "imageSize": 2735519,
    "views": 745637,
    "downloads": 548669,
    "collections": 1416,
    "likes": 1081,
    "comments": 282,
    "user_id": 2286921,
    "user": "Pexels",
    "userImageURL": "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
  }
];