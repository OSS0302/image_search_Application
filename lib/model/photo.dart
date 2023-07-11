import 'package:json_annotation/json_annotation.dart';
part 'photo.g.dart';
@JsonSerializable()
class Photo {
  int id; // 아이디
  String tags; // 태그

  @JsonKey(name: 'previewURL') // 이름이name: 'previewURL  데이터 가 들어왔을떄 맵핑를 하겠다.
  String previewUrl; // 프리뷰

// 플러터 형식으로 변환하기
  Photo({
    required this.id,
    required this.tags,
    required this.previewUrl
  }); //생성자

  // 팩토리 추가하기
  factory Photo.fromJson(Map<String,dynamic> json )=> _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
