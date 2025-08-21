import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

@freezed
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T result) = SuccessResult<T>;

  const factory ApiResult.error(String title) = ErrorResult;
}
