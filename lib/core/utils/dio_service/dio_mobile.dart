import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioUtils {
  DioUtils._();

  static Dio get getDio => Dio();

  // ignore: library_private_types_in_public_api
  static _DefaultHttpClientAdapter get httpClient => _DefaultHttpClientAdapter();
}

class _DefaultHttpClientAdapter extends IOHttpClientAdapter {
  bool withCredentials = false;
}
