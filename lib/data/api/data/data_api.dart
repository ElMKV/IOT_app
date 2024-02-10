import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:iot_app/core/constants/constant.dart';

class DataApi {
  static Future<Response?> getData() async {
    var dio = Dio();
    Response? data;
    try {
      data = await dio.get('${AppConstants.base}/api/data');
      print('STATUS ${data.statusMessage}');
      print('DATA ${data.data}');
      return data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  static Future<Response?> updateData(int temp, bool lampIsActive) async {
    var dio = Dio();
    Response? data;
    try {
      data = await dio.post('${AppConstants.base}/api/data', data: {"temp": temp,"lampIsActive": lampIsActive});
      print('STATUS ${data.statusMessage}');
      print('DATA ${data.data}');
      return data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
