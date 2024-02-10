import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:iot_app/core/constants/constant.dart';

class DataApi {
  static Future<Response?> getData() async {
    var dio = Dio();
    Response? data;
    try {
      data = await dio.get('${AppConstants.base}');
      print('STATUS ${data.statusMessage}');
      print('DATA ${data.data}');
      return data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
