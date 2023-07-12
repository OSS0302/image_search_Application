
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

part 'photo.g.dart';

@freezed
class photo with _$photo {
  factory photo({
   required int id,
   required String tags,
   required String previewURL,
  }) = _photo;

  factory photo.fromJson(Map<String, dynamic> json) => _$photoFromJson(json);
}
