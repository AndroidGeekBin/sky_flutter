import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'net_work_const.dart';
//创建请求 配置
class DioClient {
  static final _dio = Dio();

  static Dio dio() {
    return _dio;
  }
}

Future<Response<T>> buildHttpRequest<T>(String url,
    Map<String, dynamic> requestParam) {
  final jsonString = jsonEncode(requestParam);
  final headersMap = {
    "HEADER_VERSION_CODE": "1.0",
//    HEADER_PACKAGE_NAME: FLUTTER_APP_PACKAGE_NAME,
//    HEADER_VERSION_NAME: FLUTTER_APP_VERSION_NAME
  };

  return DioClient.dio().post<T>(
    url,
    data: {jsonString},
    options: Options(
        headers: headersMap, contentType: Headers.formUrlEncodedContentType),
  );
}

Future<String> doHttpGet(String url,
    {Map<String, dynamic> requestParam}) async {
  final headersMap = await buildHeadersMap();
  final dio = createDefaultDio();

  final response = await dio.get(
    url,
    queryParameters: requestParam,
    options: Options(headers: headersMap),
  );
  final secureData = response.data["data"];
  return Future<String>.value(secureData);
}



Future<dynamic> doNormalHttpPost(String url, Map<String, dynamic> requestParam) async {
  final jsonString = jsonEncode(requestParam);
  Dio dio = createDefaultDio(host: REST_API_HOST);
  final response = await dio.post(url,
      data: jsonString, options: Options(contentType: Headers.jsonContentType));
  return Future<dynamic>.value(response.data);
}



Future<Map<String, dynamic>> buildHeadersMap(
    {Map<String, dynamic> headers}) async {
  final headersMap = {
    "HEADER_VERSION_CODE": "1.0",
//    HEADER_PACKAGE_NAME: FLUTTER_APP_PACKAGE_NAME,
//    HEADER_VERSION_NAME: FLUTTER_APP_VERSION_NAME
  };
  if (headers != null) {
    headers.forEach((k, v) {
      headersMap[k] = v;
    });
  }

//  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//  final String token = sharedPreferences.getString(APP_TOKEN);
//  if (token != null) {
//    headersMap[HEADER_AUTH_TOKEN] = token;
//  }

  return Future<Map<String, dynamic>>.value(headersMap);
}

//todo singleton needed.
Dio createDefaultDio({String host = REST_API_HOST}) {
  final dio = Dio();
//  dio.interceptors.add(LogInterceptor(
//    request: true,
//    requestBody: true,
//    requestHeader: true,
//    responseBody: true,
//    responseHeader: true,
//    error: true,
//  ));
  dio.options.baseUrl = host;
  dio.options.connectTimeout = 30000;
  dio.options.receiveTimeout = 30000;
  return dio;
}

Future<String> doUploadFile(String url, String filePath,
    String fileName) async {
  final headersMap = await buildHeadersMap();
  Dio dio = createDefaultDio();
  final response = await dio.put(
    url,
    data: FormData.fromMap(
        {'file': await MultipartFile.fromFile(filePath, filename: fileName)}),
    options: Options(
        headers: headersMap, contentType: Headers.formUrlEncodedContentType),
  );
  final secureData = response.data['data'];
  return Future<String>.value(secureData);
}
