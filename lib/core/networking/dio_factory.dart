import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio? dio;
  DioFactory._();
  static Dio getDio() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    if (dio == null) {
      dio = Dio(options);
      dio!.interceptors.add(PrettyDioLogger());
      return dio!;
    } else {
      return dio!;
    }
  }
}
