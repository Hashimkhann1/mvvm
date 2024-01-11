

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:mvvmprac/data/app_exception.dart';
import 'package:mvvmprac/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServics extends BaseApiservices {


  // get api  method
  @override
  Future<dynamic> getApi(String url) async {

    dynamic responseJson;

    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 12));
      responseJson = returnResponse(response);
    }on SocketException {
      throw InternetException();
    }on TimeoutException{
      throw RequestTimeOut();
    }

    return responseJson;

  }


  // post api method
  @override
  Future<dynamic> postApi(var data, String url) async {

    dynamic responseJson;

    try{
      final response = await http.post(Uri.parse(url),
        body: jsonEncode(data)
      ).timeout(const Duration(seconds: 12));
      responseJson = returnResponse(response);
    }on SocketException {
      throw InternetException();
    }on TimeoutException{
      throw RequestTimeOut();
    }

    return responseJson;

  }

  // status code error handling

  dynamic returnResponse(http.Response response) {
    switch(response.statusCode) {
      case 200:
      // 200 OK, parse and return the response
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
      // 400 Bad Request, handle accordingly
        return BadRequestException(" ${response.statusCode.toString()}");
      case 404:
      // 404 Not Found, handle accordingly
        throw DataNotFoundException(" ${response.statusCode.toString()}");
      default:
      // Handle other status codes or provide a generic exception
        throw ApiException(" ${response.statusCode.toString()}");
    }
  }

}