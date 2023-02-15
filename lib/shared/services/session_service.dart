import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionService with ChangeNotifier{
  static String accessToken = "TOKEN";
  
  static saveAccessToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(accessToken, token);
  }

  static getAccessToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final value = preferences.getString(accessToken);
    return value;
  }

  static Future removeAccessToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}