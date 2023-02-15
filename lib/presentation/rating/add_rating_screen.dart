import 'package:fegno_assignment/presentation/review/add_review_screen.dart';
import 'package:fegno_assignment/shared/constants/font/font_constants.dart';
import 'package:fegno_assignment/shared/constants/font/size_config.dart';
import 'package:fegno_assignment/shared/constants/string_constants.dart';
import 'package:fegno_assignment/shared/widgets/appbar.dart';
import 'package:fegno_assignment/shared/widgets/appbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/rating/rating_bloc.dart';
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
        body: BlocConsumer<RatingBloc, RatingState>(
          listener: (context, state) {
            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage.toString())));
            } else if (state.updated == true) {
              Navigator.of(context).pushNamed(AddReviewScreen.routeName);
            }
          },
          builder: (context, state) {
            return createBody(context, state);
          },
        ),
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
  Widget createBody(BuildContext context, RatingState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 8),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: height * 15),
            titleSection(),
            SizedBox(height: height * 3),
            ratingSection(state, context),
            const Spacer(),
            nextButton(context,state),
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
  Widget ratingSection(RatingState state, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        starWidget(state.rating >= 1 ? Colors.green : Colors.grey, 'Very Bad',
            () {
          context.read<RatingBloc>().add(UpdateRating(rating: 1));
        }),
        starWidget(state.rating >= 2 ? Colors.green : Colors.grey, 'Bad', () {
          context.read<RatingBloc>().add(UpdateRating(rating: 2));
        }),
        starWidget(state.rating >= 3 ? Colors.green : Colors.grey, 'Ok', () {
          context.read<RatingBloc>().add(UpdateRating(rating: 3));
        }),
        starWidget(state.rating >= 4 ? Colors.green : Colors.grey, 'Good', () {
          context.read<RatingBloc>().add(UpdateRating(rating: 4));
        }),
        starWidget(state.rating >= 5 ? Colors.green : Colors.grey, 'Excellent',
            () {
          context.read<RatingBloc>().add(UpdateRating(rating: 5));
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
  Widget nextButton(BuildContext context, RatingState state) {
    return AppButton(
        buttonWidth: MediaQuery.of(context).size.width,
        title: StringConstants.next,
        color: ColorName.colorLoginButton,
        isLoading: state.isLoading,
        onTap: () {
          context.read<RatingBloc>().add(UploadRating());
        });
  }
}
