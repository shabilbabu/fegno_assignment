// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupEntity _$SignupEntityFromJson(Map<String, dynamic> json) => SignupEntity(
      isRegistered: json['isRegistered'] as bool?,
      user: json['user'] as String?,
      mobile: json['mobile'] as String?,
      otp: json['otp'] as int?,
      appSign: json['appSign'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$SignupEntityToJson(SignupEntity instance) =>
    <String, dynamic>{
      'isRegistered': instance.isRegistered,
      'user': instance.user,
      'mobile': instance.mobile,
      'otp': instance.otp,
      'appSign': instance.appSign,
      'id': instance.id,
    };
