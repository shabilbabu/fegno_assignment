import 'package:fegno_assignment/shared/constants/font/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class BuildLoginTextFieldBorder extends StatefulWidget {
  const BuildLoginTextFieldBorder({
    Key? key,
    required this.textWidth,
    this.label = '',
    this.maxLines,
    this.maxLength,
    this.suffixIcon,
    this.prefixIcon,
    required this.containerWidth,
    this.containerHeight = 50,
    required this.keyBoardType,
    this.obscureText = false,
    this.validator,
    this.textAction = TextInputAction.done,
    this.readOnly = false,
    required this.controller,
    this.textInputFormatter = const <TextInputFormatter>[],
    this.onTap,
    this.enabled = true,
    this.isWorkingHour = false,
    this.isFromBank = false,
    this.onChange,
  }) : super(key: key);

  final double textWidth;
  final double containerWidth;
  final double? containerHeight;
  final String label;
  final int? maxLines;
  final int? maxLength;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType keyBoardType;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputAction textAction;
  final List<TextInputFormatter> textInputFormatter;
  final String? Function(String? val)? validator;
  final bool readOnly;
  final void Function()? onTap;
  final bool enabled;
  final bool isWorkingHour;
  final bool isFromBank;
  final Function(String)? onChange;

  @override
  _BuildLoginTextFieldBorder createState() => _BuildLoginTextFieldBorder();
}

class _BuildLoginTextFieldBorder extends State<BuildLoginTextFieldBorder> {
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.containerWidth,
      height: widget.containerHeight,
      child: TextFormField(
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        enabled: widget.enabled,
        controller: widget.controller,
        validator: widget.validator,
        textInputAction: widget.textAction,
        onTap: widget.onTap,
        focusNode: _focusNode,
        keyboardType: widget.keyBoardType,
        obscureText: widget.obscureText,
        readOnly: widget.readOnly,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.black)),
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.black),
            ),
            // suffixText: widget.suffixText ?? "",
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            suffixIconConstraints: const BoxConstraints(minWidth: 20),
            hintText: widget.label,
            hintStyle: TextStyle(
                color: Colors.grey[500],
                fontWeight: FontWeight.w400,
                fontSize: 10.0.small13px(),
                fontFamily: 'Roboto'),
            focusColor: Theme.of(context).primaryColor,
            errorBorder: const OutlineInputBorder()),
        inputFormatters: widget.textInputFormatter,
        onChanged: widget.onChange,
      ),
    );
  }
}