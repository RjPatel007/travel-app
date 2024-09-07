import 'package:flutter/material.dart';
import 'package:travel_app_task/core/constant/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String btnName;
  final void Function() onTap;
  final Color textColor;
  final Color btnColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool? roundedBorder;
  final BoxBorder? border;
  final double? fontSize;

  const CustomButton({
    super.key,
    required this.btnName,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    this.margin,
    this.textColor = AppColors.whiteColor,
    this.btnColor = AppColors.primaryColor,
    this.roundedBorder = false,
    this.border,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
            borderRadius: roundedBorder!
                ? BorderRadius.circular(50)
                : BorderRadius.circular(5),
            border: border,
            color: btnColor),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              btnName,
              style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
