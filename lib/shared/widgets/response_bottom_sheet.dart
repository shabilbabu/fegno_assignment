import 'package:fegno_assignment/shared/constants/font/font_constants.dart';
import 'package:fegno_assignment/shared/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import '../../gen/colors.gen.dart';
import '../text_widgets/build_text.dart';

class ResponseBottomSheet extends StatefulWidget {
  const ResponseBottomSheet({
    Key? key,
    required this.appTitle,
    required this.title,
  }) : super(key: key);

  final String appTitle;
  final String title;

  @override
  State<ResponseBottomSheet> createState() => _ResponseBottomSheetState();
}

class _ResponseBottomSheetState extends State<ResponseBottomSheet> {
  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Wrap(
        children: [
          Container(
            padding: MediaQuery.of(context).viewInsets,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
              child: Column(
                children: [
                  BuildText(
                      text: widget.appTitle,
                      color: ColorName.colorLoginButton,
                      fontSize: 10.0.large23px(),
                     family: FontFamily.poppinsBold,
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 24),
                    child: BuildText(
                      text: widget.title,
                      textAlign: TextAlign.center,
                      color: Colors.grey,
                      fontSize: 10.0.medium18px(),
                      weight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
