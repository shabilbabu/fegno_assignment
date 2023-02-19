import 'package:fegno_assignment/presentation/home/home_screen.dart';
import 'package:fegno_assignment/shared/constants/font/font_constants.dart';
import 'package:fegno_assignment/shared/constants/string_constants.dart';
import 'package:fegno_assignment/shared/widgets/appbar.dart';
import 'package:fegno_assignment/shared/widgets/appbutton.dart';
import 'package:fegno_assignment/shared/widgets/show_bottom_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/home/home_bloc.dart';
import '../../application/rating/rating_bloc.dart';
import '../../application/review/review_bloc.dart';
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
        resizeToAvoidBottomInset: false,
        appBar: appbarWidget(context),
        body: BlocConsumer<ReviewBloc, ReviewState>(
          listener: (context, state) {
            if (state.errorMessage != null) {
              showSuccessPop(
                  context: context, title: state.errorMessage.toString());
            } else if (state.review.isNotEmpty) {
              showModelBottomSheet(context);
            }
          },
          builder: (context, state) {
            return createBody(context, state);
          },
        ),
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
  Widget createBody(BuildContext context, ReviewState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 3),
          firstSection(context),
          SizedBox(height: height * 4),
          writeReview(context),
          const Spacer(),
          saveButton(context, state),
          SizedBox(height: height * 3),
        ],
      ),
    );
  }

//First section
  Widget firstSection(BuildContext context) {
    int rating = context.read<RatingBloc>().state.rating;
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
              text: rating.toString()+ '.0',
              color: Colors.green,
              fontSize: 10.0.large23px(),
              family: FontFamily.poppinsSemiBold,
            ),
            SizedBox(width: width * 3),
            starIcon( rating >= 1
             ? Colors.amber
             : Colors.grey,
            ),
            SizedBox(width: 1),
            starIcon( rating >= 2
             ? Colors.amber
             : Colors.grey,
            ),
            SizedBox(width: 1),
            starIcon( rating >= 3
             ? Colors.amber
             : Colors.grey,
            ),
            SizedBox(width: 1),
            starIcon( rating >= 4
             ? Colors.amber
             : Colors.grey,
            ),
            SizedBox(width: 1),
            starIcon( rating >= 5
             ? Colors.amber
             : Colors.grey,
            ),
          ],
        ),
      ],
    );
  }

//Star icon
  Widget starIcon(Color color) {
    return Icon(
      Icons.star,
      color:
       color,
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
          label: StringConstants.pleaseWriteRevie,
          colorDecoration: null,
        ),
      ],
    );
  }

//Save button
  Widget saveButton(BuildContext context, ReviewState state) {
    return AppButton(
        buttonWidth: MediaQuery.of(context).size.width,
        title: StringConstants.save,
        color: ColorName.colorLoginButton,
        isLoading: state.isLoading,
        onTap: () {
          if (state.isLoading != true) {
            context
                .read<ReviewBloc>()
                .add(UploadReviewEvent(review: reviewController.text));
          }
        });
  }

//Success bottom sheet widget
  Future showModelBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      backgroundColor: ColorName.colorLoginButton,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 10, vertical: height * 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildText(
                text: StringConstants.appName,
                color: ColorName.colorWhite,
                fontSize: 10.0.large30px(),
                family: FontFamily.poppinsBold,
              ),
              SizedBox(height: height * 5),
              BuildText(
                text: StringConstants.successfully,
                color: ColorName.colorWhite,
                fontSize: 10.0.large22px(),
                family: FontFamily.poppinsSemiBold,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              logoutButton(context),
            ],
          ),
        );
      },
    );
  }

//Logout button
  Widget logoutButton(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<HomeBloc>().add(GetReviews());
         Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
      },
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: width * 5, vertical: height * 1),
        decoration: BoxDecoration(
          color: ColorName.colorWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_circle_right_sharp, color: ColorName.colorLoginButton, size: 25),
            SizedBox(width: width * 3),
            BuildText(
              text: 'Go to Home',
              color: ColorName.colorLoginButton,
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
