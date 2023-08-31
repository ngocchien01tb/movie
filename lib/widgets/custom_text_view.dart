import 'package:flutter/material.dart';
import 'package:movie/theme/colors.dart';

class CustomTextView extends StatelessWidget {
  final String text;
  final String? fontFamily;

  final Color? color;

  final double? sizeText;
  final int? maxLines;

  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const CustomTextView(
      {super.key,
      this.fontFamily,
      this.color,
      this.sizeText,
      this.maxLines,
      this.fontWeight,
      this.textAlign,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizeText ?? 16,
        fontFamily: fontFamily ?? 'Bold',
        color: color ?? AppColors.kColorTextBlack,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
