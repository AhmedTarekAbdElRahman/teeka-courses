import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);
  Future<Response> postData(
      {Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = 'en',
      String? token}) async {
    _dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization':'key=AAAAUQrt3Lw:APA91bGK07OEfjyLUaENc3-EJtHe5xbrRnwelk2Hz3XdcFppeHD-ufOfvgLZbbTlPdZNyda8AgcU6DCfrNvA0CRHtJtFnMe59abo8pUCTLd9A6QOcXWoWBCrrNI24JFA6-d87CVGbA78'
    };
    return await _dio.post('https://fcm.googleapis.com/fcm/send', queryParameters: query, data: data);
  }
}
