import 'package:fegno_assignment/presentation/auth/otp_screen.dart';
import 'package:fegno_assignment/shared/gen/colors.gen.dart';
import 'package:fegno_assignment/shared/constants/font/font_constants.dart';
import 'package:fegno_assignment/shared/text_widgets/build_text_form.dart';
import 'package:fegno_assignment/shared/widgets/appbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/auth/auth_bloc.dart';
import '../../shared/gen/fonts.gen.dart';
import '../../shared/constants/font/size_config.dart';
import '../../shared/constants/string_constants.dart';
import '../../shared/text_widgets/build_text.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = "/signupScreen";
  SignUpScreen({Key? key}) : super(key: key);

  //Textediting Controller
  final TextEditingController phoneOrEmailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();


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
            if(state.errorMessage != null){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage.toString())));
            }else if(state.signupEntity != null){
              Navigator.of(context)
            .pushNamedAndRemoveUntil(OtpScreen.routeName, (route) => false);
            context.read<AuthBloc>().add(OtpCountdown());
            }
          },
          builder: (context, state) {
            return _createBody(context, state);
          },
        ),
      ),
    );
  }

//Create body
  Widget _createBody(BuildContext context, AuthState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 10),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            titleSection(context),
            SizedBox(height: height * 15),
            fieldSection(context),
            SizedBox(height: height * 4),
            continueButton(context,state),
            SizedBox(height: height * 5),
            privacyPolicy(),
          ],
        ),
      ),
    );
  }

//first section
  Widget titleSection(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: height * 25),
          BuildText(
            text: StringConstants.welcomeTo,
            color: ColorName.colorPrimary,
            fontSize: 10.0.medium20px(),
            family: FontFamily.poppinsSemiBold,
          ),
          BuildText(
            text: StringConstants.appName,
            color: ColorName.colorLoginButton,
            fontSize: 10.0.large30px(),
            family: FontFamily.poppinsSemiBold,
          ),
          
          
        ],
      ),
    );
  }

//Field section
  Widget fieldSection(BuildContext context){
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: height * 0.1,
                width: width * 20,
                color: Colors.black,
              ),
              BuildText(
                text: StringConstants.loginOrSignUp,
                color: ColorName.colorPrimary,
                fontSize: 10.0.small11px(),
                family: FontFamily.poppinsRegular,
              ),
              Container(
                height: height * 0.1,
                width: width * 20,
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(height: height * 3),
          BuildLoginTextFieldBorder(
            textWidth: width,
            containerWidth: MediaQuery.of(context).size.width,
            keyBoardType: TextInputType.number,
            controller: phoneOrEmailController,
            label: StringConstants.phoneOrEmail,
            textInputFormatter: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly
                  ], colorDecoration: null,
          ),
          SizedBox(height: height * 1),
          BuildLoginTextFieldBorder(
            textWidth: width,
            containerWidth: MediaQuery.of(context).size.width,
            keyBoardType: TextInputType.emailAddress,
            controller: nameController,
            label: StringConstants.fullName, colorDecoration: null,
          ),
      ],
    );
  }

//Countinue Button
  Widget continueButton(BuildContext context, AuthState state) {
    return AppButton(
      buttonWidth: MediaQuery.of(context).size.width,
      title: StringConstants.continueText,
      color: ColorName.colorLoginButton,
      isLoading: state.isLoading,
      onTap: () {
        if(state.isLoading != true){
          context.read<AuthBloc>().add(SignupEvent(phoneNumber: phoneOrEmailController.text,fullName: nameController.text));
        }
        
      }
    );
  }

//Privacy policy
  Widget privacyPolicy() {
    return Column(
      children: [
        BuildText(
          text: StringConstants.byClickingText,
          color: Colors.grey,
          fontSize: 10.0.small10px(),
          family: FontFamily.poppinsmedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BuildText(
              text: StringConstants.privacyPolicy,
              color: Colors.black,
              fontSize: 10.0.small11px(),
              family: FontFamily.poppinsmedium,
            ),
            SizedBox(width: width * 2),
            BuildText(
              text: StringConstants.and,
              color: Colors.grey,
              fontSize: 10.0.small10px(),
              family: FontFamily.poppinsmedium,
            ),
            SizedBox(width: width * 2),
            BuildText(
              text: StringConstants.termsandCondition,
              color: Colors.black,
              fontSize: 10.0.small11px(),
              family: FontFamily.poppinsmedium,
            ),
          ],
        )
      ],
    );
  }
}
