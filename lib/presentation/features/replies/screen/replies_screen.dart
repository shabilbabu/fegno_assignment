import 'package:fegno_assignment/shared/constants/string_constants.dart';
import 'package:fegno_assignment/shared/widgets/appbar.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constants/font/size_config.dart';

class RepliesScreen extends StatelessWidget {
  static const String routeName = "/repliesScreen";
   RepliesScreen({Key? key}) : super(key: key);

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
        appBar: appbarWidget(),
      ),
    );
  }


//appbarWidget
  AppBar appbarWidget(){
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: AppbarWidget(title: StringConstants.replies),
    );
  }


//create body
  Widget createBody(){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width * 8),
      child: Column(
        children: [
          SizedBox(height: height * 3),
        ],
      ),
    );
  }
}