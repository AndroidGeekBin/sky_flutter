import 'package:dio/dio.dart';
import 'package:sky_app/network/network_manager.dart';
import 'net_work_const.dart';
//网络处理
class ApiResponse<T> {
  bool ok = false;
  String errorMessage;
  T data;

  ApiResponse.fromData(T t) {
    this.ok = true;
    this.data = t;
  }

  ApiResponse.fromError(dynamic e) {
    this.ok = false;
    if (e is DioError) {
      try {
        final errorData = e.response.data;
        this.errorMessage = errorData.toString();
      } catch (ie) {
        this.errorMessage = e.toString();
      }
    } else {
      this.errorMessage = e.toString();
    }
  }
}

class NetApi {
  static Future<ApiResponse<String>> requestSms(String mobile) async {
    try {
      final data = await doNormalHttpPost(URL_LOGIN_SMS, {"mobile": mobile});
      return Future<ApiResponse<String>>.value(ApiResponse.fromData(data));
    } catch (e) {
      return Future<ApiResponse<String>>.value(ApiResponse.fromError(e));
    }
  }
}
