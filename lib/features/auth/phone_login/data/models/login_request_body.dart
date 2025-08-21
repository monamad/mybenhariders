import 'package:json_annotation/json_annotation.dart';

part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  final String phoneNumber;
  final String password;

  LoginRequestBody({required this.phoneNumber, required this.password});

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
