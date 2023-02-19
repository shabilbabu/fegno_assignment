import 'dart:developer';

import 'package:fegno_assignment/application/auth/auth_bloc.dart';
import 'package:fegno_assignment/domain/entity/review_entity.dart';
import 'package:fegno_assignment/presentation/auth/signup_screen.dart';
import 'package:fegno_assignment/presentation/rating/add_rating_screen.dart';
import 'package:fegno_assignment/shared/constants/font/font_constants.dart';
import 'package:fegno_assignment/shared/constants/font/size_config.dart';
import 'package:fegno_assignment/shared/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/home/home_bloc.dart';
import '../../application/rating/rating_bloc.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../shared/services/session_service.dart';
import '../../shared/text_widgets/build_text.dart';
import '../../shared/widgets/show_bottom_error.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/homeScreen";
  HomeScreen({Key? key}) : super(key: key);

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
        appBar: appbarWidget(context),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.errorMessage != null) {
              return Center(
                child: TextButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(GetReviews());
                    },
                    child: BuildText(
                      text: 'Retry',
                      color: ColorName.colorPrimary,
                      fontSize: 10.0.medium17px(),
                      family: FontFamily.poppinsExtraBold,
                    )),
              );
            } else if (state.isLoading == true) {
              return Center(child: CircularProgressIndicator());
            } else if (state.reviewEntity != null) {
              return successBody(state.reviewEntity!);
            } else {
              return SizedBox();
            }
          },
        ),
        floatingActionButton: floatingActionButton(
            context, context.watch<HomeBloc>().state.reviewEntity),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

//Appbar widget
  AppBar appbarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          BuildText(
            text: 'Home',
            color: ColorName.colorPrimary,
            fontSize: 10.0.medium20px(),
            family: FontFamily.poppinsSemiBold,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: ColorName.colorLoginButton,
                    title: BuildText(
                      text: 'Do you want to Logout...?',
                      color: ColorName.colorWhite,
                      fontSize: 10.0.small14px(),
                      family: FontFamily.poppinsRegular,
                    ),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: BuildText(
                            text: 'NO',
                            color: ColorName.colorWhite,
                            fontSize: 10.0.medium16px(),
                            family: FontFamily.poppinsSemiBold,
                          ),
                        ),
                        SizedBox(width: width * 20),
                        InkWell(
                          onTap: () {
                            SessionService.removeAccessToken();
                            context
                                .read<RatingBloc>()
                                .add(UpdateRating(rating: 0));
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                SignUpScreen.routeName, (route) => false);
                          },
                          child: BuildText(
                            text: 'YES',
                            color: ColorName.colorWhite,
                            fontSize: 10.0.medium16px(),
                            family: FontFamily.poppinsSemiBold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

//Success body
  Widget successBody(ReviewsEntity reviewsEntity) {
    final listReviews = reviewsEntity.results!
        .firstWhere((element) => element.review!.isNotEmpty)
        .review;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 5),
        child: Column(
          children: [
            SizedBox(height: height * 2),
            ListView.separated(
              primary: false,
              shrinkWrap: true,
              separatorBuilder: (context, index) =>
                  SizedBox(height: height * 2),
              itemCount: listReviews!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 2, horizontal: width * 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorName.colorLoginButton),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BuildText(
                            text: listReviews[index].user.toString(),
                            color: ColorName.colorPrimary,
                            fontSize: 10.0.small14px(),
                            family: FontFamily.poppinsRegular,
                          ),
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.white, size: 15),
                                  SizedBox(width: width * 1),
                                  BuildText(
                                    text:
                                        '${listReviews[index].rating.toString()}.0',
                                    color: ColorName.colorWhite,
                                    fontSize: 10.0.small12px(),
                                    family: FontFamily.poppinsRegular,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height * 1),
                      BuildText(
                        text: listReviews[index].review.toString(),
                        color: ColorName.colorPrimary,
                        fontSize: 10.0.medium16px(),
                        family: FontFamily.poppinsmedium,
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: height * 10)
          ],
        ),
      ),
    );
  }

//Floating action button
  Widget floatingActionButton(
      BuildContext context, ReviewsEntity? reviewsEntity) {
    return SizedBox(
      height: height * 6,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 10),
        child: FloatingActionButton(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            SessionService.getUser().then((value) {
              final reviews = reviewsEntity?.results!
                      .firstWhere((element) => element.review!.isNotEmpty)
                      .review ??
                  [];
              log('..................................................................value = $value');
              final alredy = reviews.map((e) => e.user).contains(value);
              if (alredy == true) {
                showSuccessPop(
                    context: context,
                    title: 'You have already added your review');
              } else {
                Navigator.of(context).pushNamed(AddRatingScreen.routeName);
              }
            });
          },
          child: BuildText(
            text: StringConstants.addReviewAndRating,
            color: ColorName.colorWhite,
            fontSize: 10.0.small13px(),
            family: FontFamily.poppinsmedium,
          ),
          backgroundColor: ColorName.colorLoginButton,
        ),
      ),
    );
  }
}
