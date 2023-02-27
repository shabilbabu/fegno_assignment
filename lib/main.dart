import 'package:fegno_assignment/application/auth/auth_bloc.dart';
import 'package:fegno_assignment/application/home/home_bloc.dart';
import 'package:fegno_assignment/application/rating/rating_bloc.dart';
import 'package:fegno_assignment/application/review/review_bloc.dart';
import 'package:fegno_assignment/domain/repository/auth_repo.dart';
import 'package:fegno_assignment/domain/repository/home_repo.dart';
import 'package:fegno_assignment/domain/repository/rating_repo.dart';
import 'package:fegno_assignment/domain/repository/review_repo.dart';
import 'package:fegno_assignment/presentation/splash/splash_screen.dart';
import 'package:fegno_assignment/shared/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared/services/navigation_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(AuthRepo()),
        ),
        BlocProvider(
          create: (context) => RatingBloc(RatingRepo()),
        ),
        BlocProvider(
          create: (context) => ReviewBloc(ReviewRepo()),
        ),
        BlocProvider(
          create: (context) => HomeBloc(HomeRepo())..add(GetReviewsEvent()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fegno Assignment',
        routes: Routes.routes,
        navigatorKey: NavigationService.navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
