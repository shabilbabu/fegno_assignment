
import 'package:json_annotation/json_annotation.dart';
part 'signup_entity.g.dart';


@JsonSerializable()
class SignupEntity {
    SignupEntity({
         this.isRegistered,
         this.user,
         this.mobile,
         this.otp,
         this.appSign,
         this.id,
    });

    final bool? isRegistered;
    final String? user;
    final String? mobile;
    final int? otp;
    final String? appSign;
    final int? id;

    factory SignupEntity.fromJson(Map<String, dynamic> json) =>
      _$SignupEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SignupEntityToJson(this);
}