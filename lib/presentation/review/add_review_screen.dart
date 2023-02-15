import 'package:fegno_assignment/presentation/logout/logout_screen.dart';
import 'package:fegno_assignment/shared/constants/font/font_constants.dart';
import 'package:fegno_assignment/shared/constants/string_constants.dart';
import 'package:fegno_assignment/shared/widgets/appbar.dart';
import 'package:fegno_assignment/shared/widgets/appbutton.dart';
import 'package:flutter/material.dart';

import '../../shared/gen/colors.gen.dart';
import '../../shared/gen/fonts.gen.dart';
import '../../shared/constants/font/size_config.dart';
import '../../shared/text_widgets/build_text.dart';
import '../../shared/text_widgets/build_text_form.dart';

class AddReviewScreen extends StatelessWidget {
  static const String routeName = "/addReviewScreen";
  AddReviewScreen({Key? key}) : super(key: key);

  //height and width
  double height = 0.0;
  double width = 0.0;

  //Textediting controller
  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    height = SizeConfig.safeBlockVertical!;
    width = SizeConfig.safeBlockHorizontal!;
    return SafeArea(
      child: Scaffold(
        appBar: appbarWidget(context),
        body: createBody(context),
      ),
    );
  }

//appbar widget
  AppBar appbarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: AppbarWidget(
        title: StringConstants.review,
        onTap: () => Navigator.of(context).pop(),
      ),
    );
  }

//Create body
  Widget createBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 3),
          firstSection(),
          SizedBox(height: height * 4),
          writeReview(context),
          const Spacer(),
          saveButton(context),
          SizedBox(height: height * 3),
        ],
      ),
    );
  }

//First section
  Widget firstSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 3),
        BuildText(
          text: StringConstants.rating,
          color: ColorName.colorPrimary,
          fontSize: 10.0.large22px(),
          family: FontFamily.poppinsSemiBold,
        ),
        SizedBox(height: height * 1),
        Row(
          children: [
            BuildText(
              text: '4.0',
              color: Colors.green,
              fontSize: 10.0.large23px(),
              family: FontFamily.poppinsSemiBold,
            ),
            SizedBox(width: width * 3),
            starIcon(Colors.amber),
            SizedBox(width: 1),
            starIcon(Colors.amber),
            SizedBox(width: 1),
            starIcon(Colors.amber),
            SizedBox(width: 1),
            starIcon(Colors.amber),
            SizedBox(width: 1),
            starIcon(Colors.grey),
          ],
        ),
      ],
    );
  }

//Star icon
  Widget starIcon(Color color) {
    return Icon(
      Icons.star,
      color: color,
      size: 22,
    );
  }

//Write review widget
  Widget writeReview(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildText(
          text: StringConstants.writeReview,
          color: Colors.black,
          fontSize: 10.0.medium16px(),
          family: FontFamily.poppinsSemiBold,
        ),
        SizedBox(height: height * 1),
        BuildLoginTextFieldBorder(
          textWidth: width,
          maxLines: 20,
          containerHeight: 150,
          containerWidth: MediaQuery.of(context).size.width,
          keyBoardType: TextInputType.name,
          controller: reviewController,
          label: StringConstants.pleaseWriteRevie, colorDecoration: null,
        ),
      ],
    );
  }

//Save button
  Widget saveButton(BuildContext context) {
    return AppButton(
      buttonWidth: MediaQuery.of(context).size.width,
      title: StringConstants.save,
      color: ColorName.colorLoginButton,
      onTap: () => Navigator.of(context).pushNamed(LogoutScreen.routeName),
    );
  }
}
