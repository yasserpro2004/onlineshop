import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appStyle(double size, Color color, FontWeight fw,{double? fh}) {
  return GoogleFonts.poppins(
      color: color, fontSize: size, fontWeight: fw, height: fh);
}

 const  Color appBackgroundColor = Color(0xFFE2E2E2);