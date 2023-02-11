import 'package:fegno_assignment/presentation/auth/signup_screen.dart';
import 'package:fegno_assignment/shared/constants/font/font_constants.dart';
import 'package:flutter/material.dart';

import '../../shared/gen/colors.gen.dart';
import '../../shared/gen/fonts.gen.dart';
import '../../shared/constants/font/size_config.dart';
import '../../shared/constants/string_constants.dart';
import '../../shared/text_widgets/build_text.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splahScreen";
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //height and width
  double height = 0.0;
  double width = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(SignUpScreen.routeName, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    height = SizeConfig.safeBlockVertical!;
    width = SizeConfig.safeBlockHorizontal!;
    return SafeArea(
      child: Scaffold(
        body: createBody(context),
      ),
    );
  }

//Create body
  Widget createBody(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorName.colorLoginButton,
      ),
      child: Center(
        child: BuildText(
          text: StringConstants.appName,
          color: ColorName.colorWhite,
          fontSize: 10.0.large30px(),
          family: FontFamily.poppinsSemiBold,
        ),
      ),
    );
  }
}
