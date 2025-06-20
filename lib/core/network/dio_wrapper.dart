import 'dart:io';


import 'package:dio/dio.dart';

class ViolationDioWrapper {
  static Dio provide() {
    final dio = Dio();
    dio.interceptors.add(_getResponseInterceptor());
    return dio;
  }

  static QueuedInterceptor _getResponseInterceptor() {
    return QueuedInterceptorsWrapper(
      onRequest: _onRequest,
      onError: _onError,
      onResponse: _onResponse,
    );
  }

  static void _onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {

    options.headers['Accept'] = 'application/json';
    options.headers['Content-Type'] = 'application/json';
    options.headers["Access-Control-Allow-Origin"] = "*";
    options.headers["Access-Control-Allow-Credentials"] = true;
    // options.headers["x-api-key"] = Constants.xApiKey;
    options.headers["Accept-Encoding"] = "gzip, deflate, br";
    options.headers["Access-Control-Allow-Headers"] =
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale";
    options.headers["Access-Control-Allow-Methods"] =
        "GET, HEAD, POST, OPTIONS";
    options.connectTimeout = const Duration(seconds: 100);
    options.receiveTimeout = const Duration(seconds: 100);
    options.sendTimeout = const Duration(seconds: 100);
    return handler.next(options);
      
  }

  static void _onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }

  static void _onError(
      DioException errorOptions, ErrorInterceptorHandler handler) async {
  //       if (errorOptions.response?.statusCode == HttpStatus.unauthorized) {
  //   // Navigate to the login screen
  //   navigatorKey.currentState?.pushNamedAndRemoveUntil(
  //     '/login', // Replace with your login route
  //     (route) => false, // Clear the navigation stack
  //   );

  //   return handler.reject(DioException(
  //     requestOptions: errorOptions.requestOptions,
  //   ));
  // }
    print(errorOptions.response?.statusCode);
    print(errorOptions.response);
    //  print("Request headers: ${errorOptions.response?.headers}");
    //  print("Request URL: ${errorOptions.requestOptions.uri}");
    // print("Status Code: ${errorOptions.response?.statusCode}");
    // print("Response Data: ${errorOptions.response?.data}");
    // print("Error Message: ${errorOptions.message}");
    if (errorOptions.error is SocketException) {
      return handler
          .reject(DioException(requestOptions: errorOptions.requestOptions));
    }
    switch (errorOptions.response?.statusCode) {
      case HttpStatus.forbidden:
        return handler.reject(DioException(
          requestOptions: errorOptions.requestOptions,
        ));
      // case 413:
      //   return handler.reject(DioException(
      //       requestOptions: errorOptions.requestOptions,
      //       error: AppException(exceptionMessage: 'Unauthorized')));
      // case 401:
      //   return handler.reject(DioException(
      //       requestOptions: errorOptions.requestOptions,
      //       error: AppException(exceptionMessage: 'Unauthorized')));
      default:
        if (errorOptions.response != null) {
          return handler.resolve(errorOptions.response!);
        }
    }
    return handler
        .next(DioException(requestOptions: errorOptions.requestOptions));
  }
}