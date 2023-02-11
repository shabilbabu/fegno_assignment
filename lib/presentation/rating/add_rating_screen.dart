import 'package:fegno_assignment/presentation/review/add_review_screen.dart';
import 'package:fegno_assignment/shared/constants/font/font_constants.dart';
import 'package:fegno_assignment/shared/constants/font/size_config.dart';
import 'package:fegno_assignment/shared/constants/string_constants.dart';
import 'package:fegno_assignment/shared/widgets/appbar.dart';
import 'package:fegno_assignment/shared/widgets/appbutton.dart';
import 'package:flutter/material.dart';

import '../../shared/gen/colors.gen.dart';
import '../../shared/gen/fonts.gen.dart';
import '../../shared/text_widgets/build_text.dart';

class AddRatingScreen extends StatelessWidget {
  static const String routeName = "/addRatingScreen";
  AddRatingScreen({Key? key}) : super(key: key);

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
        resizeToAvoidBottomInset: false,
        appBar: appbarWidget(context),
        body: createBody(context),
      ),
    );
  }

//Appbar Widget
  AppBar appbarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: AppbarWidget(
        title: StringConstants.yourRating,
        // onTap: () => Navigator.of(context).pop(),
      ),
    );
  }

//Create body
  Widget createBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 8),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: height * 15),
            titleSection(),
            SizedBox(height: height * 3),
            ratingSection(),
            const Spacer(),
            nextButton(context),
            SizedBox(height: height * 3),
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
          text: StringConstants.rateYourExperience,
          color: ColorName.colorPrimary,
          fontSize: 10.0.large25px(),
          family: FontFamily.poppinsSemiBold,
        ),
        SizedBox(height: height * 3),
        BuildText(
          textAlign: TextAlign.center,
          text: StringConstants.didYouEnjoy,
          color: Colors.grey,
          fontSize: 10.0.small11px(),
          family: FontFamily.poppinsmedium,
        ),
      ],
    );
  }

//Rating section
  Widget ratingSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        starWidget(Colors.green, 'Very Bad', () {
          return null;
        }),
        starWidget(Colors.green, 'Bad', () {
          return null;
        }),
        starWidget(Colors.green, 'Ok', () {
          return null;
        }),
        starWidget(Colors.green, 'Good', () {
          return null;
        }),
        starWidget(Colors.grey, 'Excellent', () {
          return null;
        }),
      ],
    );
  }

//star widget
  Widget starWidget(Color color, String title, Function() ontap) {
    return Column(
      children: [
        IconButton(
            onPressed: ontap,
            icon: Icon(
              Icons.star,
              color: color,
              size: 30,
            )),
        BuildText(
          textAlign: TextAlign.center,
          text: title,
          color: Colors.grey,
          fontSize: 10.0.small11px(),
          family: FontFamily.poppinsmedium,
        ),
      ],
    );
  }

//Next button
  Widget nextButton(BuildContext context) {
    return AppButton(
      buttonWidth: MediaQuery.of(context).size.width,
      title: StringConstants.next,
      color: ColorName.colorLoginButton,
      onTap: () => Navigator.of(context).pushNamed(AddReviewScreen.routeName),
    );
  }
}
