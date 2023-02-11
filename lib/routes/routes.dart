import 'package:fegno_assignment/presentation/features/auth/otp/screen/otp_screen.dart';
import 'package:fegno_assignment/presentation/features/auth/sign_up/screen/signup_screen.dart';
import 'package:fegno_assignment/presentation/features/rating/screen/add_rating_screen.dart';
import 'package:fegno_assignment/presentation/features/replies/screen/replies_screen.dart';
import 'package:fegno_assignment/presentation/features/review/screen/add_review_screen.dart';
import 'package:fegno_assignment/presentation/features/splash/screen/splash_screen.dart';

class Routes{
  static var routes = {
    SignUpScreen.routeName: (ctx) =>  SignUpScreen(),
    OtpScreen.routeName: (ctx) =>  OtpScreen(),
    SplashScreen.routeName: (ctx) =>  SplashScreen(),
    AddRatingScreen.routeName: (ctx) =>  AddRatingScreen(),
    AddReviewScreen.routeName: (ctx) =>  AddReviewScreen(),
    RepliesScreen.routeName: (ctx) =>  RepliesScreen(),
  };
}