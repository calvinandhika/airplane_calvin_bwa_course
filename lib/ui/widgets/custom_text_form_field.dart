import 'package:flutter/material.dart';
import 'package:travel_apps/shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  }) : super(key: key);

  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: regular,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          obscureText: obscureText ? true : false,
          controller: controller,
          cursorColor: kBlackColor,
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: regular),
          decoration: InputDecoration(
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 5, color: kRedColor),
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
          ),
        )
      ],
    );
  }
}
