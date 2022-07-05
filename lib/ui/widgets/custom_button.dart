import 'package:flutter/material.dart';
import 'package:travel_apps/shared/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.onPressedFunction,
    this.width = double.infinity,
  }) : super(key: key);

  final String buttonText;
  final Function() onPressedFunction;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
        onPressed: onPressedFunction,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultRadius)),
          primary: kPrimaryColor,
          padding: const EdgeInsets.symmetric(vertical: 14),
          minimumSize: const Size(220, 55),
        ),
        child: Text(
          buttonText,
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
