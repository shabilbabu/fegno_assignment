import 'package:fegno_assignment/shared/constants/font/font_constants.dart';
import 'package:flutter/material.dart';

import '../gen/colors.gen.dart';
import '../gen/fonts.gen.dart';
import '../text_widgets/build_text.dart';
import '../constants/font/size_config.dart';


class AppbarWidget extends StatelessWidget {
  AppbarWidget({Key? key, required this.title, this.onTap}) : super(key: key);

  final String title;
  final Function()? onTap;

  //height and width
  double height = 0.0;
  double width = 0.0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    height = SizeConfig.safeBlockVertical!;
    width = SizeConfig.safeBlockHorizontal!;
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: height * 4,
            width: width * 8,
            decoration:
                BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
        ),
        const Spacer(),
        BuildText(
          text: title,
          color: ColorName.colorPrimary,
          fontSize: 10.0.medium16px(),
          family: FontFamily.poppinsSemiBold,
        ),
        const Spacer(),
        SizedBox(width: width * 8),
      ],
    );
  }
}
