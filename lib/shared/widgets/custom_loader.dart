import 'package:flutter/material.dart';

import '../../gen/colors.gen.dart';

class CustomProgressIndicatorWidget extends StatelessWidget {
  final bool showBackColor;
  final bool isVisible;

  const CustomProgressIndicatorWidget({
    this.showBackColor = true,
    this.isVisible = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 100,
        constraints: const BoxConstraints.expand(),
        child: AbsorbPointer(
          absorbing: true,
          child: Center(
            child: Container(
              height: 55,
              width: 55,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ]),
              child: const Center(
                child: CircularProgressIndicator(
                  color: ColorName.colorPrimary,
                  strokeWidth: 2,
                ),
              ),
            ),
          ),
        ),
        decoration:
            BoxDecoration(color: showBackColor ? Colors.black12 : Colors.white),
      ),
    );
  }
}
