import 'package:fegno_assignment/presentation/auth/otp_screen.dart';
import 'package:fegno_assignment/presentation/auth/signup_screen.dart';
import 'package:fegno_assignment/presentation/rating/add_rating_screen.dart';
import 'package:fegno_assignment/presentation/logout/logout_screen.dart';
import 'package:fegno_assignment/presentation/review/add_review_screen.dart';
import 'package:fegno_assignment/presentation/splash/splash_screen.dart';

class Routes{
  static var routes = {
    SignUpScreen.routeName: (ctx) =>  SignUpScreen(),
    OtpScreen.routeName: (ctx) =>  OtpScreen(),
    SplashScreen.routeName: (ctx) =>  SplashScreen(),
    AddRatingScreen.routeName: (ctx) =>  AddRatingScreen(),
    AddReviewScreen.routeName: (ctx) =>  AddReviewScreen(),
    LogoutScreen.routeName: (ctx) =>  LogoutScreen(),
  };
}