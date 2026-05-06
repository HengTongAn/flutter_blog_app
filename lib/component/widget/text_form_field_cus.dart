import 'package:flutter/material.dart';
import 'package:flutter_blog_application/app/constants/colors.dart';
import 'package:flutter_blog_application/component/style/border_style.dart';
import 'package:flutter_blog_application/theme/app_text_style.dart';

class TextFormFieldCus extends StatelessWidget {
  const TextFormFieldCus({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.icon,
  });
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        focusedBorder: BorderStyling.focusedBorder,
        enabledBorder: BorderStyling.border,
        errorBorder: BorderStyling.errorBorder,
        prefixIcon: Icon(icon, color: AppColors.mediumGrey),
        errorStyle: AppTextStyle.errorTextStyle,
        filled: true,
        fillColor: AppColors.lightAliceBlue,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
      ),
    );
  }
}
