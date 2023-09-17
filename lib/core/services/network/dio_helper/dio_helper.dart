import 'package:dio/dio.dart';
import 'package:untitled1/core/services/network/dio_helper/end_points.dart';

class DioHelper {
  static late Dio dio;

  static Future<void> init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
      ),
    );
  }

  static Future<Response> post({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer $token',
        'Accept':'application/json',
      };
      var response = await dio.post(
        endPoint,
        queryParameters: queryParameters,
        data: data,
      );
      return response;
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404){
        final data = e.response?.data;
        final message = data['message'];
        print(message);
        print("1");
      }
      // print("error $e");
      rethrow;
    }
  }

  static Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer $token',
      };
      var response = await dio.get(
        endPoint,
        queryParameters: queryParameters,
        data: data,
      );
      return response;
    } catch (e) {
      print("error $e");
      rethrow;
    }
  }

  static Future<Response> delete({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer $token',
      };
      var response = await dio.delete(
        endPoint,
        queryParameters: queryParameters,
        data: data,
      );
      return response;
    } catch (e) {
      print("error $e");
      rethrow;
    }
  }
}
