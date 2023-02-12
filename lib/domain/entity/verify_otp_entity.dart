// To parse this JSON data, do
//
//     final verifyOtpEntity = verifyOtpEntityFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_entity.g.dart';


@JsonSerializable()
class VerifyOtpEntity {
    VerifyOtpEntity({
         this.token,
         this.user,
         this.userId,
    });

    final String? token;
    final String? user;
    @JsonKey(name: 'user_id')
    final int? userId;

    factory VerifyOtpEntity.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpEntityFromJson(json);
    
}