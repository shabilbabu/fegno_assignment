import 'package:fegno_assignment/shared/constants/font/font_constants.dart';
import 'package:fegno_assignment/shared/widgets/appbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../application/auth/auth_bloc.dart';
import '../../shared/gen/colors.gen.dart';
import '../../shared/gen/fonts.gen.dart';
import '../../shared/constants/font/size_config.dart';
import '../../shared/constants/string_constants.dart';
import '../../shared/text_widgets/build_text.dart';
import '../rating/add_rating_screen.dart';

class OtpScreen extends StatelessWidget {
  static const String routeName = "/otpScreen";
  OtpScreen({Key? key}) : super(key: key);

  //Textediting Controller
  final TextEditingController otpController = TextEditingController();

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
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            return _createBody(context,state);
          },
        ),
      ),
    );
  }

//Create body
  Widget _createBody(BuildContext context, AuthState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 10),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: height * 20),
            titleSection(),
            SizedBox(height: height * 5),
            fieldWidget(),
            SizedBox(height: height * 4),
            otpField(context),
            resendTimer(state.countDown),
            SizedBox(height: height * 6),
            verifyButton(context),
            SizedBox(height: height * 5),
            resendButton(context),
          ],
        ),
      ),
    );
  }

//Title section
  Widget titleSection() {
    return Column(
      children: [
        BuildText(
          text: StringConstants.appName,
          color: ColorName.colorLoginButton,
          fontSize: 10.0.large30px(),
          family: FontFamily.poppinsSemiBold,
        ),
        SizedBox(height: height * 10),
        BuildText(
          text: StringConstants.verifyYourNumber,
          color: ColorName.colorPrimary,
          fontSize: 10.0.large25px(),
          family: FontFamily.poppinsSemiBold,
        ),
      ],
    );
  }

//Field widget
  Widget fieldWidget() {
    return Column(
      children: [
        BuildText(
          textAlign: TextAlign.center,
          text: StringConstants.fourDigitOTP,
          color: Colors.grey,
          fontSize: 10.0.small11px(),
          family: FontFamily.poppinsmedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BuildText(
              text: '+91 8139008887',
              color: Colors.grey,
              fontSize: 10.0.small11px(),
              family: FontFamily.poppinsmedium,
            ),
            SizedBox(width: width * 2),
            Icon(
              Icons.mode_edit_outlined,
              size: 18,
            ),
          ],
        )
      ],
    );
  }

//Otp field
  Widget otpField(BuildContext context) {
    return PinCodeTextField(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      autoDisposeControllers: false,
      appContext: context,
      length: 4,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        selectedFillColor: ColorName.colorLoginButton,
        inactiveFillColor: Colors.white,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 50,
        inactiveColor: Colors.black,
        activeColor: Colors.transparent,
        fieldWidth: 50,
        selectedColor: Colors.transparent,
        activeFillColor: Colors.grey[300],
      ),
      animationDuration: const Duration(milliseconds: 300),
      keyboardType: TextInputType.number,
      controller: otpController,
      enableActiveFill: true,
      onCompleted: (value) {},
      onChanged: (value) {},
    );
  }

//Resend Timer
  Widget resendTimer(int countDown) {
    return BuildText(
      text:'00:' + countDown.toString(),
      color: Colors.red,
      fontSize: 10.0.small13px(),
      family: FontFamily.poppinsSemiBold,
    );
  }

//verify button
  Widget verifyButton(BuildContext context) {
    return AppButton(
      buttonWidth: MediaQuery.of(context).size.width,
      title: StringConstants.verify,
      color: ColorName.colorLoginButton,
      onTap: () => Navigator.of(context).pushNamed(AddRatingScreen.routeName),
    );
  }

//Resend button
  Widget resendButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BuildText(
          text: StringConstants.didntRecieve,
          color: Colors.grey,
          fontSize: 10.0.small11px(),
          family: FontFamily.poppinsmedium,
        ),
        SizedBox(width: width * 1),
        InkWell(
          onTap: () => context.read<AuthBloc>().add(ResendOtp()),
          child: BuildText(
            text: StringConstants.resend,
            color: Colors.red,
            fontSize: 10.0.small13px(),
            family: FontFamily.poppinsmedium,
          ),
        ),
      ],
    );
  }
}
