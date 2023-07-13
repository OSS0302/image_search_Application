import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success; //  성공생성자
  const factory Result.error(String e) = Error; //  실패 생성자
}
