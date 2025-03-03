import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;

import '../ApiPath.dart';
import 'app_exeptions.dart';

class BaseClient {
  static const int TIME_OUT_DURATION = 20;

  final dio = Dio();

  String getUrl({
    required String url,
    Map<String, String>? extraParameters,
  }) {
    return '${ApiPath.baseUrl}/$url';
  }

  Future<dynamic> get(String api, {dynamic header}) async {
    var uri = getUrl(url: api);
    try {
      var response = await dio.get(uri, options: Options(headers: header)).timeout(const Duration(seconds: TIME_OUT_DURATION));
      print(" \n \n \n Get Url: $api $header \n \n Get Response: $response \n \n \n ");
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('Server connection failed.Please check your internet connection & pull to refresh', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }

  Future<dynamic> post(String api, {dynamic body, dynamic header}) async {
    var uri = getUrl(url: api);

    var payload = json.encode(body);
    // log("URL===> $uri");
    // log("BODY===> $payload");
    try {
      var response = await dio.post(uri, data: payload, options: Options(method: 'POST', headers: header)).timeout(const Duration(seconds: TIME_OUT_DURATION));
      print(" \n \n \n Post Url: $uri $payload \n \n Post Response: $response \n \n \n ");
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    } catch (e) {
      print(" \n \n \n Post Response error: $e \n \n \n ");
    }
  }

  Future<dynamic> put(String api, {dynamic body, dynamic header}) async {
    var uri = getUrl(url: api);

    var payload = json.encode(body);
    // log("URL===> $uri");
    // log("BODY===> $payload");
    try {
      var response = await dio.put(uri, data: payload, options: Options(headers: header)).timeout(const Duration(seconds: TIME_OUT_DURATION));
      print(" \n \n \n Put Url: $uri $payload \n \n Put Response: $response \n \n \n ");
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }

  Future<dynamic> postMultipart(String api, {Map<String, dynamic>? body, dynamic header, String? type}) async {
    var uri = getUrl(url: api);

    final formData = FormData.fromMap({});

    var keys = body?.keys.toList();
    for (var key in keys!) {
      if (key.toLowerCase().contains("file")) {
        formData.files.add(MapEntry(key, await MultipartFile.fromFile(body![key] ?? "", filename: p.basename(body[key]!))));
      } else {
        formData.fields.add(MapEntry(key, body![key]!));
      }
    }

    // log("URL===> $uri");
    // log("BODY===> $body");
    try {
      var response = await dio
          .request(uri, data: formData, options: Options(headers: header, method: type ?? "POST"))
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      log(" \n \n \n postMultipart Url: $uri $formData $keys \n \n postMultipart Response ==> $response \n \n \n ");
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    } on DioException catch (e) {
      // Print the response for debugging
      print("\n \n \n");
      print("Dio error: ${e.response?.data}");
      print("Status code: ${e.response?.statusCode}");
      print("Headers: ${e.response?.headers}");
    } catch (ex) {
      log("Error ==> ${ex.toString()} ");
    }
  }

  Future<dynamic> delete(String api, {dynamic body, dynamic header}) async {
    var uri = getUrl(url: api);

    var payload = json.encode(body);
    try {
      var response = await dio.delete(uri, data: payload, options: Options(headers: header)).timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }

  //DELETE
  //OTHER

  dynamic _processResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(response.data, response.realUri.toString());
      case 401:
        throw AuthenticationError(utf8.decode(response.data), response.realUri.toString());
      case 403:
        throw UnAuthorizedException(utf8.decode(response.data), response.realUri.toString());
      case 422:
        throw BadRequestException(utf8.decode(response.data), response.realUri.toString());
      case 500:
        throw ServerError(utf8.decode(response.data), response.realUri.toString());
      default:
        throw FetchDataException(
            // 'Error occured with code : ${response.statusCode}',
            response.realUri.toString());
    }
  }
}
