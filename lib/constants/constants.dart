import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//  COLORS
const Color gClr = Color(0xff0f4751);
final Color gClrwithAlpha = gClr.withAlpha(200);
const Color wClr = Color(0xffffffff);

// BoxShadow
final BoxShadow shadowBox = BoxShadow(
  color: gClr.withAlpha(100),
  offset: const Offset(0, 6),
  blurRadius: 7,
  spreadRadius: 1,
);

// TEXT_STYLES
var fontStyle = GoogleFonts.poppins;
final TextStyle g16 =
fontStyle(color: gClr, fontSize: 16, fontWeight: FontWeight.w700);
final TextStyle g18 =
fontStyle(color: gClr, fontSize: 18, fontWeight: FontWeight.w700);
final TextStyle g24 =
fontStyle(color: gClr, fontSize: 24, fontWeight: FontWeight.w700);
final TextStyle g32 = fontStyle(
    color: gClr, fontSize: 32, fontWeight: FontWeight.w700);
final TextStyle g32withAlpha = fontStyle(
    color: gClrwithAlpha, fontSize: 32, fontWeight: FontWeight.w700);
