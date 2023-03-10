import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:fegno_assignment/domain/entity/verify_otp_entity.dart';
import 'package:fegno_assignment/shared/constants/api_constants.dart';
import '../entity/signup_entity.dart';

class AuthRepo {
  Future<SignupEntity> signUp(
      {required String phoneNumber, required String name}) async {
    log(phoneNumber.toString());
    Map<String, dynamic> payload = {
      "mobile": phoneNumber,
      "app_sign": "testing_sign",
      "name": name
    };

    try {
      final response = await Dio().post(ApiConstants.signup, data: payload);
      final model = SignupEntity.fromJson(response.data);
      log(response.data.toString());
      if (model.otp != null) {
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

//Verify otp
  Future<VerifyOtpEntity> verifyOtp(
      {required String otp, required String phoneNumber}) async {
    Map<String, dynamic> payload = {
      "mobile": phoneNumber,
      "otp": otp,
    };

    try {
      final response = await Dio().post(ApiConstants.otp, data: payload);
      final model = VerifyOtpEntity.fromJson(response.data);
      log('Token ************** ${model.token}');
      if (model.token != null) {
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



//Resend OTP

}
