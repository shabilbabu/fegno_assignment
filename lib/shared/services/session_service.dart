import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  static String accessToken = "TOKEN";
  static String userKey = 'USER';
  static String? userName;

  static saveAccessToken(String token, String user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(accessToken, token);
    await preferences.setString(userKey, user);
  }

  static getAccessToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final value = preferences.getString(accessToken);
    return value;
  }

  static Future<String> getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final value = preferences.getString(userKey);
    return value ?? '';
  }

  static Future removeAccessToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
