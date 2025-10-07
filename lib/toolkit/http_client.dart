import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:royalxui/toolkit.dart' as t;
import 'package:royalxui/uikit.dart' as u;
import 'package:universal_io/io.dart';

class HttpClient {
  final Future<void> Function()? retryRequest;

  bool justCloseNoInternet;

  final _dio = Dio();

  HttpClient({this.retryRequest, this.justCloseNoInternet = false}) {
    _dio.options.baseUrl = t.Urls.baseUrl;
    _dio.options.connectTimeout = Duration(seconds: 20);
    _dio.options.sendTimeout =  Duration(seconds: 20);
    _dio.options.receiveTimeout =  Duration(seconds: 20);
    _dio.options.headers = _header;

    _dio.interceptors.add(_AuthInterceptor(_dio));

    _dio.interceptors.add(_prettyDioLogger());

    _dio.interceptors.add(
      _ErrorInterceptors(_dio, retryRequest, justCloseNoInternet),
    );
  }

  Future<dynamic> post(
    String url, {
    dynamic body,
    dynamic queryParameters,
    CancelToken? cancelToken,
    bool isSuccessStatus = true,
    String? textSuccessStatus,
    bool? justCloseNoInternet,
  }) async {
    if (await u.InternetConnectionChecker().hasConnection || t.Utils.isPlatformWeb) {
      final response = await _dio.post(
        url,
        data: body,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );

      if (isSuccessStatus) {
        t.Utils.showSnackBar(
          type: u.SnackbarType.success,
          text:
              textSuccessStatus ??
              (t.BaseResponse.fromJson(response.data).message ??
                  'درخواست با موفقعیت'),
        );
      }

      return response;
    } else {
      getx.Get.dialog(
        u.NoInternetDialog(
          retry: retryRequest,
          justClose: justCloseNoInternet ?? true,
        ),
        barrierDismissible: false,
        transitionCurve: Curves.easeInOutCirc,
        useSafeArea: true,
      );
    }
  }

  Future<dynamic> put(
    String url, {
    dynamic body,
    dynamic queryParameters,
    CancelToken? cancelToken,
    bool isSuccessStatus = true,
    String? textSuccessStatus,
    bool? justCloseNoInternet,
  }) async {
    if (await u.InternetConnectionChecker().hasConnection || t.Utils.isPlatformWeb) {
      final response = await _dio.put(
        url,
        data: body,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );

      if (isSuccessStatus) {
        t.Utils.showSnackBar(
          type: u.SnackbarType.success,
          text:
              textSuccessStatus ??
              (t.BaseResponse.fromJson(response.data).message ??
                  'درخواست با موفقعیت'),
        );
      }

      return response;
    } else {
      getx.Get.dialog(
        u.NoInternetDialog(
          retry: retryRequest,
          justClose: justCloseNoInternet ?? true,
        ),
        barrierDismissible: false,
        transitionCurve: Curves.easeInOutCirc,
        useSafeArea: true,
      );
    }
  }

  Future<dynamic> delete(
    String url, {
    dynamic body,
    CancelToken? cancelToken,
    dynamic queryParameters,
    bool isSuccessStatus = true,
    String? textSuccessStatus,
    bool? justCloseNoInternet,
  }) async {
    if (await u.InternetConnectionChecker().hasConnection || t.Utils.isPlatformWeb) {
      final response = await _dio.delete(
        url,
        data: body,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );

      if (isSuccessStatus) {
        t.Utils.showSnackBar(
          type: u.SnackbarType.success,
          text:
              textSuccessStatus ??
              (t.BaseResponse.fromJson(response.data).message ??
                  'درخواست با موفقعیت'),
        );
      }

      return response;
    } else {
      getx.Get.dialog(
        u.NoInternetDialog(
          retry: retryRequest,
          justClose: justCloseNoInternet ?? true,
        ),
        barrierDismissible: false,
        transitionCurve: Curves.easeInOutCirc,
        useSafeArea: true,
      );
    }
  }

  Future<dynamic> get(
    String url, {
    dynamic queryParameters,
    CancelToken? cancelToken,
    bool isSuccessStatus = true,
    String? textSuccessStatus,
    bool? justCloseNoInternet,
  }) async {
    if (await u.InternetConnectionChecker().hasConnection || t.Utils.isPlatformWeb) {
      Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );

      if (isSuccessStatus) {
        t.Utils.showSnackBar(
          type: u.SnackbarType.success,
          text:
              textSuccessStatus ??
              (t.BaseResponse.fromJson(response.data).message ??
                  'درخواست با موفقعیت'),
        );
      }

      return response;
    } else {
      getx.Get.dialog(
        u.NoInternetDialog(
          retry: retryRequest,
          justClose: justCloseNoInternet ?? true,
        ),
        barrierDismissible: false,
        transitionCurve: Curves.easeInOutCirc,
        useSafeArea: true,
      );
    }
  }
}

class _AuthInterceptor extends Interceptor {
  final Dio dio;

  _AuthInterceptor(this.dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String token = t.Urls.token;
    if (token.isEmpty) {
      if (t.DataBase.hasData(t.Constants.token)) {
        token = await t.DataBase.read(t.Constants.token);
      }
    }
    options.headers['Authorization'] = 'Bearer $token';
    return handler.next(options);
  }
}

class _ErrorInterceptors extends Interceptor {
  final Dio dio;
  final Future<void> Function()? retryRequest;
  final bool justCloseNoInternet;

  _ErrorInterceptors(this.dio, this.retryRequest, this.justCloseNoInternet);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        _noInternetConnectionHandler(
          justCloseNoInternet,
          retryRequest,
          title: 'سرویس پاسخگو نبود. لطفا دوباره سعی نمائید',
        );
        throw Exception('The connection has timed out');
      case DioExceptionType.cancel:
        throw Exception('Dio interceptorHandler cancel');
      case DioExceptionType.unknown:
        _noInternetConnectionHandler(justCloseNoInternet, retryRequest);
        throw Exception('error connection detected');
      default:
        switch (err.response?.statusCode) {
          case 400:
            t.Utils.showSnackBar(
              type: u.SnackbarType.error,
              text:
                  t.BaseResponse.fromJson(err.response?.data).message ??
                  'درخواست نامعتبر 400',
            );
            throw _DioErrorException('DioError 400: Invalid request.');
          case 401:
          case 403:
            _noInternetConnectionHandler(
              justCloseNoInternet,
              retryRequest,
              title: 'دسترسی مجاز نمی باشد. لطفا دوباره سعی نمائید',
            );
            throw _DioErrorException('DioError 401: Access denied.');
          case 404:
            _noInternetConnectionHandler(
              justCloseNoInternet,
              retryRequest,
              title: 'اطلاعات درخواستی یافت نشد. لطفا دوباره سعی نمائید',
            );
            throw _DioErrorException(
              'DioError 404: The requested information could not be found.',
            );
          case 409:
            _noInternetConnectionHandler(
              justCloseNoInternet,
              retryRequest,
              title: 'درگیری رخ داد. لطفا دوباره سعی نمائید',
            );
            throw _DioErrorException('DioError 409: Conflict occurred.');
          case 500:
            _noInternetConnectionHandler(
              justCloseNoInternet,
              retryRequest,
              title: 'مشکلی در سرور رخ داده. لطفا دوباره سعی نمائید',
            );
            throw _DioErrorException(
              'DioError 500: There is a problem with the server.',
            );
          case 502:
            _noInternetConnectionHandler(
              justCloseNoInternet,
              retryRequest,
              title: 'سرویس در دسترس نمی باشد. لطفا دوباره سعی نمائید',
            );
            throw _DioErrorException(
              'DioError 502: The service is not available.',
            );
          default:
            _noInternetConnectionHandler(
              justCloseNoInternet,
              retryRequest,
              title:
                  'برقراری ارتباط با سرور هم اکنون مقدور نمی باشد. لطفا دوباره سعی نمائید',
            );
        }
        break;
    }
    return handler.next(err);
  }
}

PrettyDioLogger _prettyDioLogger() {
  return PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    compact: false,
  );
}

final Map<String, String> _header = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  'package-name': 'com.example.royalxui',
  'platform': t.Utils.isPlatformWeb ? 'web' : Platform.operatingSystem,
  'Authorization': "access_token",
  'apikey': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN2cHBjYmxkZnNybXprdG96eWNuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTExMTMzMjIsImV4cCI6MjA2NjY4OTMyMn0.QoRjWpekl1Q5vKx4cJeCcoca-P6S5VBe8vX1lhadHPU',
};

Future _noInternetConnectionHandler(
  bool justCloseNoInternet,
  Future<void> Function()? retryRequest, {
  String? title,
}) {
  return getx.Get.dialog(
    u.NoInternetDialog(
      retry: retryRequest,
      justClose: justCloseNoInternet,
      title: title,
    ),
    barrierDismissible: false,
    transitionCurve: Curves.easeInOutCirc,
    useSafeArea: true,
  );
}

class _DioErrorException extends DioError {
  final String title;
  _DioErrorException(this.title)
    : super(requestOptions: RequestOptions(path: ''));

  @override
  String toString() {
    return title;
  }
}
