import 'package:fegno_assignment/presentation/auth/otp_screen.dart';
import 'package:fegno_assignment/presentation/auth/signup_screen.dart';
import 'package:fegno_assignment/presentation/home/home_screen.dart';
import 'package:fegno_assignment/presentation/rating/add_rating_screen.dart';
import 'package:fegno_assignment/presentation/review/add_review_screen.dart';
import 'package:fegno_assignment/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes{
  static var routes = {
    SignUpScreen.routeName: (ctx) =>  SignUpScreen(),
    OtpScreen.routeName: (ctx) {
      final phoneNUmber = (ModalRoute.of(ctx)!.settings.arguments as Map )['phone'] as String;
      return OtpScreen(phoneNumber: phoneNUmber);
    },
    SplashScreen.routeName: (ctx) =>  SplashScreen(),
    AddRatingScreen.routeName: (ctx) =>  AddRatingScreen(),
    AddReviewScreen.routeName: (ctx) =>  AddReviewScreen(),
    HomeScreen.routeName: (ctx) =>  HomeScreen(),
  };
}