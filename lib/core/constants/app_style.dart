import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/color_palette.dart';

class AppStyles {
  static TextStyle bold20Primary = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: ColorPalette.primaryColor,
  );
  static TextStyle bold24Black = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: ColorPalette.blackColor,
  );
  static TextStyle bold16Primary = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: ColorPalette.primaryColor,
  );

  static TextStyle medium14Primary = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ColorPalette.primaryColor,
  );
  static TextStyle medium14Black = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ColorPalette.blackColor,
  );
  static TextStyle medium24White = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: ColorPalette.primaryColor,
  );
  static TextStyle medium24Black = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: ColorPalette.blackColor,
  );
  static TextStyle bold20Black = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: ColorPalette.blackColor,
  );
  static TextStyle bold16Black = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: ColorPalette.blackColor,
  );

  static TextStyle medium20White = GoogleFonts.inter(
    fontSize: 20,
    color: ColorPalette.primaryColor,
  );
  static TextStyle medium12Grey = GoogleFonts.inter(
    fontSize: 12,
    color: ColorPalette.greyColor,
  );
}
