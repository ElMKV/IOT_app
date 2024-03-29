import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:iot_app/data/api/data/data_api.dart';
import 'package:iot_app/data/model/data.dart';
import 'package:iot_app/data/network/dio_exception.dart';


class DataRepository {
  Future<Data?> getData() async {
    try {
      final response = await DataApi.getData();
      return (response?.data != null)
          ? Data.fromJson(response!.data)
          : const Data();
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      // final SnackBar snackBar = SnackBar(content: Text(errorMessage));
      // snackbarKey.currentState?.showSnackBar(snackBar);
      return const Data();
    }
  }
  Future<Data?> updateData(int temp, bool lampIsActive) async {
    print('temp from state to api - $temp');
    try {
      final response = await DataApi.updateData(temp, lampIsActive);
      return (response?.data != null)
          ? Data.fromJson(response!.data)
          : const Data();
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      // final SnackBar snackBar = SnackBar(content: Text(errorMessage));
      // snackbarKey.currentState?.showSnackBar(snackBar);
      return const Data();
    }
  }
}


