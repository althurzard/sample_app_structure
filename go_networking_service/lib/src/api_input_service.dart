import 'package:dio/dio.dart';

enum RequestType { POST, GET }

abstract class BaseAPIServiceInterface {
  Map<String, String> headers;
  String baseURL;
}

abstract class InputServiceInterface extends BaseAPIServiceInterface {
  String path;
  String encoding;
  RequestType requestType;
  String get fullPath => '$baseURL$path';
  Map<String, String> queryParameters;
}

class DefaultInputService extends InputServiceInterface {
  @override
  String baseURL = '';

  @override
  String encoding = Headers.jsonContentType;

  @override
  Map<String, String> headers = {};

  @override
  String path = '';

  @override
  RequestType requestType = RequestType.GET;

  @override
  Map<String, String> queryParameters = {};

  DefaultInputService(
      {this.baseURL = '',
      this.encoding = '',
      this.headers = const {},
      this.path = '',
      this.requestType = RequestType.GET,
      this.queryParameters = const {}});
}
