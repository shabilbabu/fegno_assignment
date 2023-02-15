import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fegno_assignment/shared/constants/api_constants.dart';
import 'package:fegno_assignment/shared/services/session_service.dart';

class ReviewRepo{
  Future<bool> uploadReview({required review}) async {
    Map<String, dynamic> payload = {
      "fitness_center": "47",
      "review": review,
    };

    final token = await SessionService.getAccessToken();
    final headers = {
      'Authorization': 'Token ${token}',
    };

    try{
      final response = await Dio().post(ApiConstants.uploadReview, data: payload, options: Options(headers: headers));
      final model = response.data["message"] == "Review updated";

      log(response.data.toString());
      if(model == true){
        return model;
      } else {
        throw 'Something went wrong! Please try again later.';
      }
    } on DioError catch (e) {
      if(e.message.contains('SocketException')){
        throw 'Please make sure about your Connection!';
      } else {
        throw 'Something went wrong! Please try again later.';
      }
    }
  }
}