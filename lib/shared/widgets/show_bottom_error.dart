import 'package:fegno_assignment/shared/constants/string_constants.dart';
import 'package:fegno_assignment/shared/widgets/response_bottom_sheet.dart';
import 'package:flutter/material.dart';


void showSuccessPop({
  required BuildContext context,
  required String title,

}) async {
  Future.delayed(const Duration(seconds: 2)).then((value) {
    Navigator.of(context).pop();
  });

  await showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    isDismissible: false,
    enableDrag: false,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return ResponseBottomSheet(
        appTitle: StringConstants.appName,
        title: title,
      );
    },
  );
}
