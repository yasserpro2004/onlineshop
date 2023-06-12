import 'package:flutter/material.dart';
import 'package:onlineshop/config/constant/app_sizes.dart';

import '../widgets.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final double width;
  final Color backgroundColor;
  final Color forColor;

  const CustomButton({
    super.key,
    required this.label,
    this.onTap,
    required this.width,
    required this.backgroundColor,
    required this.forColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 50,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: backgroundColor),
          child: Center(
            child: LabelWidget(
              label: label,
              size: Sizes.p16,
              fontWeight: FontWeight.w700,
              color: forColor,
            ),
          )),
    );
  }
}
