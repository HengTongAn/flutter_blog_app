import 'package:flutter/material.dart';
import 'package:flutter_blog_application/app/constants/colors.dart';

class BorderStyling {
  static final border = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(10),
  );

  static final focusedBorder = border.copyWith(
    borderSide: BorderSide(
      color: AppColors.royalBlue,
      width: 1.5,
      style: BorderStyle.solid,
    ),
  );

  static final errorBorder = focusedBorder.copyWith(
    borderSide: BorderSide(color: AppColors.deepRed),
  );
}
