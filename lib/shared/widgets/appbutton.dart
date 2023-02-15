import 'package:fegno_assignment/shared/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import '../gen/colors.gen.dart';
import '../text_widgets/build_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.buttonWidth,
    this.isLoading,
    required this.title,
    required this.color,
    this.onTap,
  }) : super(key: key);

  final double buttonWidth;
  final String title;
  final Color color;
  final Function()? onTap;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        width: buttonWidth,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(12)),
        child: (isLoading ?? false) != true
            ? BuildText(
                text: title,
                color: ColorName.colorWhite,
                family: FontFamily.poppinsSemiBold,
              )
            : Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BuildText(
                      text: 'Loading...',
                      color: ColorName.colorWhite,
                      family: FontFamily.poppinsSemiBold,
                    ),
                    SizedBox(width: 5),
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
