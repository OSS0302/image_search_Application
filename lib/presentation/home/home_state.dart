import 'package:image_search/domain/model/photo.dart';

class HomeState {
  final List<Photo> photos;
  final bool isLoading;

  HomeState(this.photos, this.isLoading); //생성자 추가getter 를 사용하면 외부에서 사용할수없다 .

  HomeState copy({List<Photo>? photos, bool? isLoading}) { // 카피하는 메서드 추가
    return HomeState(photos ?? this.photos, isLoading ??= this.isLoading);
  }
}
