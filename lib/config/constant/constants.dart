import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appStyle(double size, Color color, FontWeight fw, {double? fh}) {
  return GoogleFonts.poppins(
      color: color, fontSize: size, fontWeight: fw, height: fh);
}

class AppColors {
  static const Color appBackgroundColor = Color(0xFFE2E2E2);
}

class AppDatabasesName {
  static const String cartBoxName = 'cart_box';
  static const String wishlistBoxName = 'wishlist_box';
  static const String cartAdaptorName = 'CartItemAdapter';
  static const String wishlistAdaptorName = 'WishlistItemAdapter';
}
