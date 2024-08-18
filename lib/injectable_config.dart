import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:image_gallery_app/injectable_config.config.dart';
import 'package:injectable/injectable.dart';
import 'core/network/network_info.dart';
import 'core/utils/dio_service/dio_export.dart';
import 'package:image_gallery_app/core/network/interceptors/custom_interceptor.dart';
import 'package:image_gallery_app/core/utils/constants.dart';

final GetIt getIt = GetIt.instance;

@module
abstract class RegisterModule {
  @lazySingleton
  @preResolve
  Future<Dio> dio() => DioInstance.create();
}

@injectableInit
Future<void> configureInjection(String enviroment) async => getIt.init(environment: enviroment);

class DioInstance {
  static Dio? dio;

  static Future<Dio> create() async {
    final BaseOptions options = BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: const Duration(milliseconds: Constants.connectTimeout),
      receiveTimeout: const Duration(milliseconds: Constants.receiveTimeout),
    );

    getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

    dio = DioUtils.getDio;
    dio?.options = options;

    dio?.interceptors.addAll([CustomInterceptor(getIt<NetworkInfo>())]);
    if (kIsWeb) {
      final adapter = DioUtils.httpClient;
      dio?.httpClientAdapter = adapter;
    } else {
      dio?.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient();
          client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
          return client;
        },
      );
    }

    return dio!;
  }
}
