import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fegno_assignment/shared/services/session_service.dart';

import '../../shared/constants/api_constants.dart';

class RatingRepo {
  Future<bool> uploadRating({required rating}) async {
    Map<String, dynamic> payload = {
      "fitness_center": "43",
      "rating": rating.toString(),
    };
    final token = await SessionService.getAccessToken();
    final headers = {
      'Authorization': 'Token ${token}',
    };

    try {
      final response = await Dio().post(ApiConstants.uploadRating,
          data: payload, options: Options(headers: headers));
      final model = response.data["message"] == "Rating updated";
      log(response.toString());

      if (model == true) {
        return model;
      } else {
        throw 'Something went wrong! Please try again later.';
      }
    } on DioError catch (e) {
      if (e.message.contains('SocketException')) {
        throw 'Please make sure about your Connection!';
      } else {
        throw 'Something went wrong! Please try again later.';
      }
    }
  }
}
