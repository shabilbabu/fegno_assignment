import 'package:fegno_assignment/presentation/auth/signup_screen.dart';
import 'package:fegno_assignment/shared/constants/font/font_constants.dart';
import 'package:fegno_assignment/shared/constants/string_constants.dart';
import 'package:fegno_assignment/shared/services/session_service.dart';
import 'package:flutter/material.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../shared/constants/font/size_config.dart';
import '../../shared/text_widgets/build_text.dart';


class LogoutScreen extends StatelessWidget {
  static const String routeName = "/logoutScreen";
  LogoutScreen({Key? key}) : super(key: key);

  //height and width
  double height = 0.0;
  double width = 0.0;

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

//create body
  Widget createBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: height * 5),
          const Spacer(),
          BuildText(
            text: StringConstants.successfully,
            color: ColorName.colorPrimary,
            fontSize: 10.0.large25px(),
            family: FontFamily.poppinsSemiBold,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          logoutButton(context),
          SizedBox(height: height * 5),
        ],
      ),
    );
  }


//Logout button
  Widget logoutButton(BuildContext context) {
    return InkWell(
      onTap: () {
        SessionService.removeAccessToken();
        Navigator.of(context).pushNamedAndRemoveUntil(SignUpScreen.routeName, (route) => false);
      },
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: width * 5, vertical: height * 1),
        decoration: BoxDecoration(
          color: ColorName.colorLoginButton,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, color: ColorName.colorWhite, size: 25),
            SizedBox(width: width * 3),
            BuildText(
              text: StringConstants.logout,
              color: ColorName.colorWhite,
              fontSize: 10.0.small14px(),
              family: FontFamily.poppinsSemiBold,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
