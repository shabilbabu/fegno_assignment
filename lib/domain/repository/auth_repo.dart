import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fegno_assignment/application/auth/auth_bloc.dart';
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
      if (response.statusCode == 200) {
        log(response.data.toString());
        log(response.statusCode.toString());
        return SignupEntity.fromJson(response.data);
      } else {
        throw 'Something went wrong! Please try again later.';
      }
    } on SocketException {
      throw 'Please make sure about your Connection!';
    } on DioError catch (e) {
      // log(e.response?.data.toString());
      log(e.toString());
      throw 'Something went wrong! Please try again later.';
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
      if (response.statusCode == 200) {
        log(response.data.toString());
        log(response.statusCode.toString());
        return VerifyOtpEntity.fromJson(response.data);
      } else {
        throw 'Something went wrong! Please try again later.';
      }
    } on SocketException {
      throw 'Please make sure about your Connection!';
    } on DioError catch (e) {
      // log(e.response?.data.toString());
      log(e.toString());
      throw 'Something went wrong! Please try again later.';
    }
  }
}
