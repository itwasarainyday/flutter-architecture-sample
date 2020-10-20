import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterarchitecturesample/credentials.dart';

class DioUtils {
  static Dio createDio() {
    Dio dio = Dio();
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 20000;

    // Determine if we are running in debug
    if (!kReleaseMode &&
        CHARLES_PROXY_LOCAL_IP_ADDRESS_ANDROID.isNotEmpty &&
        CHARLES_PROXY_LOCAL_IP_ADDRESS_IOS.isNotEmpty) {
      String proxy = Platform.isAndroid
          ? CHARLES_PROXY_LOCAL_IP_ADDRESS_ANDROID
          : CHARLES_PROXY_LOCAL_IP_ADDRESS_IOS;

      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        // Hook into the findProxy callback to set the client's proxy.
        client.findProxy = (url) {
          return 'PROXY $proxy';
        };

        // This is a workaround to allow Charles to receive
        // SSL payloads when your app is running on Android.
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => Platform.isAndroid;
      };
    }

    return dio;
  }
}
