import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

class DioUtils {
  DioUtils._();

  static Dio get getDio => DioForBrowser();

  static BrowserHttpClientAdapter get httpClient => BrowserHttpClientAdapter();
}
