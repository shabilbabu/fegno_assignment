// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpEntity _$VerifyOtpEntityFromJson(Map<String, dynamic> json) =>
    VerifyOtpEntity(
      token: json['token'] as String?,
      user: json['user'] as String?,
      userId: json['user_id'] as int?,
    );

Map<String, dynamic> _$VerifyOtpEntityToJson(VerifyOtpEntity instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
      'user_id': instance.userId,
    };
