import 'package:dio/dio.dart';

class FetchClient {
  Dio get dio {
    var _dio = Dio();
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) async {
        //SharedPreferences prefs = await SharedPreferences.getInstance();
        options.headers['Content-Type'] = 'application/json';
        // try {
        //   var token = prefs.getString('token');
        //   if (token != null && token.isNotEmpty) {
        //     options.headers['Authorization'] = "ABC $token";
        //   }
        //   print(options.uri);
        //   print(options.headers);
        // } catch (error) {
        //   print(error);
        // }
        print(options.uri);
        print(options.headers);
        return options;
      },
    ));
    return _dio;
  }

  Future<Response> fetchData({Uri uri}) async {
    return await dio.getUri(uri);
  }

  Future<Response> post({Uri uri, Map<String, dynamic> data}) async {
    return await dio.postUri(uri, data: data);
  }
}
