import 'package:flutter/material.dart';
import 'package:movie/theme/colors.dart';
import 'package:movie/widgets/custom_text_view.dart';

class AppBarHomeView extends StatelessWidget {
  final IconData? icon;
  final Color? colorIcon;

  final String? textAppBar;

  final double? sizeIcon;
  const AppBarHomeView({
    super.key,
    this.icon,
    this.colorIcon,
    this.textAppBar,
    this.sizeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon ?? Icons.error_outline_outlined,
            size: sizeIcon ?? 25.0,
            color: colorIcon ?? AppColors.kColorTextBlack,
          ),
          const SizedBox(
            width: 5,
          ),
          CustomTextView(
            text: textAppBar ?? 'MOVIE',
            sizeText: 20,
          )
        ],
      ),
    );
  }
}
