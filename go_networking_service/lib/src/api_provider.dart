import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_networking_service/src/error.dart';
import 'storage_token_processor.dart';
import 'api_input_service.dart';

abstract class NetworkConfigurable extends BaseAPIServiceInterface {
  String refreshTokenPath;
}

class DefaultNetworkConfigurable implements NetworkConfigurable {
  @override
  String baseURL;

  @override
  Map<String, String> headers;

  @override
  String refreshTokenPath;

  DefaultNetworkConfigurable(
      {this.baseURL = '', this.headers = const {}, this.refreshTokenPath = ''});
}

class APIProvider {
  var _dio = Dio();

  NetworkConfigurable networkConfiguration;

  StorageTokenProcessor storageTokenProcessor;

  Interceptor interceptor;

  APIProvider(
      {@required this.networkConfiguration,
      @required this.storageTokenProcessor,
      this.interceptor}) {
    var interceptor = this.interceptor ??
        InterceptorsWrapper(
            onRequest: _onRequest, onError: _onError, onResponse: _onResponse);
    _dio.interceptors.add(interceptor);
    _dio.options.baseUrl = networkConfiguration.baseURL;
  }

  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: handle refresh token
    print(options.uri);
    print(options.headers);
    return handler.next(options);
  }

  void _onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  void _onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  Future<Response> request({@required InputServiceInterface input}) async {
    _dio.options.headers = _defaultHeaders(input.headers);
    _dio.options.contentType = input.encoding;
    Uri fullPath;
    if (input.baseURL.isNotEmpty && input.path.isNotEmpty) {
      fullPath = Uri.parse(input.fullPath)
          .replace(queryParameters: input.queryParameters);
    }
    switch (input.requestType) {
      case RequestType.GET:
        return _dioGet(uri: fullPath, input: input);
      case RequestType.POST:
        return _dioPost(uri: fullPath, input: input);
    }
    return Future.error(AppError(
        errorCode: ErrorCode.BAD_REQUEST, message: 'Unknown request type'));
  }

  Future<Response> _dioGet({Uri uri, InputServiceInterface input}) async {
    Response response;
    try {
      if (uri != null) {
        response = await _dio.getUri(uri);
      } else {
        response =
            await _dio.get(input.path, queryParameters: input.queryParameters);
      }
      return Future.value(response);
    } on DioError catch (e) {
      return Future.error(AppError.withDioError(e));
    }
  }

  Future<Response> _dioPost({Uri uri, InputServiceInterface input}) async {
    Response response;
    try {
      if (uri != null) {
        response = await _dio.postUri(uri);
      } else {
        response = await _dio.post(input.path, data: input.queryParameters);
      }
      return Future.value(response);
    } on DioError catch (e) {
      return Future.error(AppError.withDioError(e));
    }
  }

  Map<String, String> _defaultHeaders(Map<String, String> otherHeaders) =>
      {...networkConfiguration.headers, ...otherHeaders};
}
