import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:causeways_live/data/datasource/remote/dio/dio_client.dart';
import 'package:causeways_live/data/datasource/remote/exception/api_error_handler.dart';
import 'package:causeways_live/data/model/response/base/api_response.dart';

class OnBoardingRepo {
  final DioClient dioClient;

  OnBoardingRepo({required this.dioClient});

  Future<ApiResponse> getSGTrafficCamera(BuildContext context) async {
    try {
      Response response = await dioClient
          .get('https://api.data.gov.sg/v1/transport/traffic-images');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getCurrenyRate(BuildContext context) async {
    try {
      Response response = await dioClient.get(
          'https://v6.exchangerate-api.com/v6/1ffc273c62b949f2af182719/latest/SGD');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
