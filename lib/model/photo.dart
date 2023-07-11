import 'package:json_annotation/json_annotation.dart';
part 'photo.g.dart';
@JsonSerializable()
class Photo {
  int id; // 아이디
  String tags; // 태그
  String previewURL; // 프리뷰
// 플러터 형식으로 변환하기
  Photo({
    required this.id,
    required this.tags,
    required this.previewURL
  }); //생성자

  // 팩토리 추가하기
  factory Photo.fromJson(Map<String,dynamic> json )=> _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
