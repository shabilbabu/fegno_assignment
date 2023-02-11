import 'package:fegno_assignment/presentation/splash/splash_screen.dart';
import 'package:fegno_assignment/shared/routes/routes.dart';
import 'package:flutter/material.dart';
import 'shared/services/navigation_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fegno Assignment',
      routes: Routes.routes,
      navigatorKey: NavigationService.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}