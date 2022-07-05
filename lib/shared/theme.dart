import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double defaultMargin = 24.0;
const double defaultRadius = 17.0;

const Color kPrimaryColor = Color(0xFF5C40CC);
const Color kBlackColor = Color(0xFF1F1449);
const Color kWhiteColor = Color(0xFFFFFFFF);
const Color kGreyColor = Color(0xFF9698A9);
const Color kGreenColor = Color(0xFF0EC3AE);
const Color kRedColor = Color(0xFFEB70A5);
const Color kBackgroundColor = Color(0xFFFAFAFA);
const Color kInactiveColor = Color(0xFFDBD7EC);
const Color kTransparent = Colors.transparent;
const Color kAvailableColor = Color(0xFFE0D9FF);
const Color kUnavailableColor = Color(0xFFEBECF1);

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: kBlackColor,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: kWhiteColor,
);

TextStyle greyTextStyle = GoogleFonts.poppins(
  color: kGreyColor,
);

TextStyle greenTextStyle = GoogleFonts.poppins(
  color: kGreenColor,
);

TextStyle redTextStyle = GoogleFonts.poppins(
  color: kRedColor,
);

TextStyle purpleTextStyle = GoogleFonts.poppins(
  color: kPrimaryColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
