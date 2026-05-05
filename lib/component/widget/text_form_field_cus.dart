import 'package:flutter/material.dart';
import 'package:flutter_blog_application/component/style/border_style.dart';

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
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        prefixIcon: Icon(icon),
      ),
    );
  }
}
