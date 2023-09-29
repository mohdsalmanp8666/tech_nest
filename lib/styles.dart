import 'package:flutter/material.dart';

// * Default Margin
const double defaultMargin = 15;

// * AppBar measurements
const double appBarHeight = 70;
const double appBarMargin = 20; // Only at top i.e. EdgeInsets.only(top: 20);
// Only Left and Right i.e. EdgeInsets.only(left: 20, right: 10),
const double appBarPaddingLeft = 20;
const double appBarPaddingRight = 15;

// * Colors to be used in the whole app
const primaryColor = Color(0xFF1F75FE);
const secondaryColor = Color(0xFF0063B2);
const greyColor = Color(0xFF212121);
const successColor = Color(0xFF7EFAB9);
const errorColor = Color(0xFFB00020);

// * Headline sizes
const double h1 = 60;
const double h2 = 48;
const double h3 = 34;
const double h4 = 24;
const double h5 = 20;
const double body = 16;
const double errorText = 12;

TextStyle headLine(double h, FontWeight fw, Color color) {
  return TextStyle(
    fontSize: h,
    fontWeight: fw,
    color: color,
  );
}

// * Bottom Navigation bar style
bottomNavIcon(IconData ic) {
  return Icon(
    ic,
    color: greyColor.withOpacity(0.6),
  );
}

// * Theme for dark mode
ThemeData darkTheme() {
  return ThemeData(
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: h1,
        color: Colors.white,
      ),
    ),
  );
}
