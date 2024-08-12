import 'dart:io';

import 'package:betting_tips/services/api_constant.dart';
import 'package:betting_tips/utils/custom_exception.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';

class ApiUtils {
  final _dio = Dio();
  static PersistCookieJar? _cookieJar;

  final box = GetStorage();

  static final ApiUtils singleton = ApiUtils._();
  factory ApiUtils() => singleton;
  ApiUtils._() {
    _dio.options.baseUrl = ApiConstant.baseUrl;
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.options.sendTimeout = const Duration(seconds: 30);
    _dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';
    _dio.options.headers['Accept'] = '*/*';

    // String cookies = box.read('cookies') ?? '';
    // if (box.read('cookies') != null) {
    //   _dio.options.headers['Cookie'] = cookies;
    // }
  }

  setGitCookies(String cookies) {
    _dio.options.headers['Cookie'] = cookies;
    print("git cookies>>$cookies");
  }

  static Future<PersistCookieJar> get cookieJar async {
    if (_cookieJar == null) {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      print("Obtained file system directory appdocpath: " + appDocPath);
      _cookieJar = PersistCookieJar(storage: FileStorage(appDocPath));
    }
    return _cookieJar!;
  }

  void setCookies(String cookies) {
    int index = cookies.indexOf(';');
    String session = cookies.substring(0, index);
    _dio.options.headers['Cookie'] = session;
    print("Cookies>>>$session");
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      throw NoInternetException();
    }

    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
      );

      return response;
    } on DioException catch (dioError) {
      if (dioError.type == DioExceptionType.cancel) {
        throw CustomException("Request to API server was cancelled");
      } else if (dioError.type == DioExceptionType.receiveTimeout) {
        throw CustomException(
            "Receiving time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.sendTimeout) {
        throw CustomException(
            "Sending time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.connectionTimeout) {
        throw CustomException(
            "Connecting time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.badCertificate) {
        throw CustomException("Caused by an incorrect certificate.");
      } else if (dioError.type == DioExceptionType.badResponse) {
        throw CustomException(
            "Received invalid status code: ${dioError.response?.statusCode}");
      } else if (dioError.type == DioExceptionType.connectionError) {
        throw CustomException("Caused by SocketExceptions.");
      } else if (dioError.type == DioExceptionType.unknown) {
        throw CustomException(
            "Cannot connect to server! Please check your network connection.");
      } else {
        throw CustomException();
      }
    }
  }

  Future<Response> post({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      throw NoInternetException();
    }
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      // if (response.statusCode != 200) {
      //   throw CustomException(response.data['message']);
      // }
      print("resp>>>>>>$response");
      return response;
    } on DioException catch (dioError) {
      if (dioError.type == DioExceptionType.cancel) {
        throw CustomException("Request to API server was cancelled");
      } else if (dioError.type == DioExceptionType.receiveTimeout) {
        throw CustomException(
            "Receiving time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.sendTimeout) {
        throw CustomException(
            "Sending time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.connectionTimeout) {
        throw CustomException(
            "Connecting time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.badCertificate) {
        throw CustomException("Caused by an incorrect certificate.");
      } else if (dioError.type == DioExceptionType.badResponse) {
        throw CustomException(
            "Received invalid status code: ${dioError.response?.statusCode}");
      } else if (dioError.type == DioExceptionType.connectionError) {
        throw CustomException("Caused by SocketExceptions.");
      } else if (dioError.type == DioExceptionType.unknown) {
        throw CustomException(
            "Cannot connect to server! Please check your network connection.");
      } else {
        throw CustomException();
      }
    }
  }

  Future<Response> patch({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      throw NoInternetException();
    }
    try {
      final Response response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      if (response.statusCode != 200) {
        throw CustomException(response.data['message']);
      }
      return response;
    } on DioException catch (dioError) {
      if (dioError.type == DioExceptionType.cancel) {
        throw CustomException("Request to API server was cancelled");
      } else if (dioError.type == DioExceptionType.receiveTimeout) {
        throw CustomException(
            "Receiving time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.sendTimeout) {
        throw CustomException(
            "Sending time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.connectionTimeout) {
        throw CustomException(
            "Connecting time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.badCertificate) {
        throw CustomException("Caused by an incorrect certificate.");
      } else if (dioError.type == DioExceptionType.badResponse) {
        throw CustomException(
            "Received invalid status code: ${dioError.response?.statusCode}");
      } else if (dioError.type == DioExceptionType.connectionError) {
        throw CustomException("Caused by SocketExceptions.");
      } else if (dioError.type == DioExceptionType.unknown) {
        throw CustomException(
            "Cannot connect to server! Please check your network connection.");
      } else {
        throw CustomException();
      }
    }
  }

  Future<Response> delete({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      throw NoInternetException();
    }

    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (dioError) {
      if (dioError.type == DioExceptionType.cancel) {
        throw CustomException("Request to API server was cancelled");
      } else if (dioError.type == DioExceptionType.receiveTimeout) {
        throw CustomException(
            "Receiving time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.sendTimeout) {
        throw CustomException(
            "Sending time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.connectionTimeout) {
        throw CustomException(
            "Connecting time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.badCertificate) {
        throw CustomException("Caused by an incorrect certificate.");
      } else if (dioError.type == DioExceptionType.badResponse) {
        throw CustomException(
            "Received invalid status code: ${dioError.response?.statusCode}");
      } else if (dioError.type == DioExceptionType.connectionError) {
        throw CustomException("Caused by SocketExceptions.");
      } else if (dioError.type == DioExceptionType.unknown) {
        throw CustomException(
            "Cannot connect to server! Please check your network connection.");
      } else {
        throw CustomException();
      }
    }
  }
}
