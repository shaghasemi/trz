import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hamdars/app/app_const.dart';
import 'package:hamdars/core/utils/custom_exception.dart';

class WebDio {
  static Dio? _dio;

// Set default configs
  static Future<Dio> instance() async {
    if (_dio == null) {
      _dio = Dio();
      _dio?.options.baseUrl = AppConst.baseUrlMobile;
      _dio?.options.connectTimeout = const Duration(milliseconds: 50000);
      _dio?.options.receiveTimeout = const Duration(milliseconds: 30000);
      _dio?.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };
    }
    return _dio!;
  }

  static void clearInstance() {
    _dio = null;
  }
}

class WebClient {
  Future<dynamic> get({
    final bool hasToken = true,
    required final uri,
    final Options? cashOption,
    final CancelToken? cancelToken,
    final Map<String, dynamic>? queryParameters,
    final bool fullResponse = true,
    final String? customToken,
  }) async {
    final Dio dio = await WebDio.instance();
    /*if (hasToken) {
      final String token = customToken ??
          AuthenticationBloc.getInstance().state.authModel?.accessToken ??
          '';
      dio.options.headers.putIfAbsent(
        'Authorization',
        () => 'Bearer $token',
      );
    } else {
      dio.options.headers.remove('Authorization');
    }*/
    final Response response = await dio
        .get(
      uri,
      options: cashOption,
      cancelToken: cancelToken,
      queryParameters: queryParameters,
    )
        .catchError((final dynamic error) {
      debugPrint('Print get 90: $error');
      if ((error is DioException) && error.response != null) {
        if (error.response?.statusCode == 422) {
          final String message = error.response?.data['message'] ?? 'خطا';
          throw CustomException.failure(message);
        } else if (error.response?.statusCode == 401) {
          throw CustomException.failure(
            'خطا در احراز هویت! لطفا دوباره وارد شوید.',
          );
        }
      }
      throw CustomException.networkError();
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else {
      throw CustomException.networkError();
    }
  }
}
