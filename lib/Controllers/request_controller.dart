// import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:olympe/statics.dart';

class RequestController {
  Future<http.Response> get({required String apiRoute,required Map<String, String> headers}) async {
    final response = env == Environment.development
        ? await http.get(Uri.http(baseURL, apiRoute), headers: headers).timeout(const Duration(seconds: 10))
        : await http.get(Uri.https(baseURL, apiRoute), headers: headers).timeout(const Duration(seconds: 10));
    return response;
  }

  Future<http.Response> post({required String apiRoute, required Map<String, String> body,required Map<String, String> headers}) async {
    final response = env == Environment.development
        ? await http.post(Uri.http(baseURL, apiRoute),body: body, headers: headers).timeout(const Duration(seconds: 10))
        : await http.post(Uri.https(baseURL, apiRoute),body: body, headers: headers).timeout(const Duration(seconds: 10));
    return response;
  }
}