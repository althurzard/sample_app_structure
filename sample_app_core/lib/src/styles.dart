import 'package:flutter/material.dart';

class AppColors {
  static const kPrimaryColor = Color(0xFF506DF5);
  static const kPrimaryVariantColor = Color(0xFF264cf2);
  static const kPrimaryLightColor = Color(0xFF879bf8);
  static const kPrimaryLigterColor = Color(0xFFe7ebfe);

  static const kTileColor = Color(0xff505050);

  static const kNegativeColor = Color(0xFFF44336);
  static const kPositiveColor = Color(0xff17a862);

  static const kLightGray = Color(0xffcdcdcd);
  static const kLighterGray = Color(0xff898989);
  static const kGray = Color(0xff757575);
  static const kBGGray = Color(0xFF444044);
  var kSecondaryGray = Colors.grey[200];

  static const kScaffoldBackground = Color(0xfff8fcff);
  static const kTransparentWhite = Color(0x88ffffff);

  static const Color kRedColor = Color(0xFFFD2446);
  static const Color kGreenColor = Color(0xFF00C48C);
  static const Color kBlueColor = Color(0xFF5BBDF5);
}

class AppStyles {
  /// This is the common border radious of all the containers in the app.
  static const kStandardBorder = BorderRadius.all(Radius.circular(6));

  /// This is the common border radious of all the containers in the app.
  static const kCardBorder = BorderRadius.all(Radius.circular(10));

  /// This border is slightly more sharp than the standard boder.
  static const kSharpBorder = BorderRadius.all(Radius.circular(2));

  /// This is the common text styling for a subtile.
  static const kSubtitleStyling = TextStyle(
      color: AppColors.kGray, fontSize: 24, fontWeight: FontWeight.w800);

  /// This is the common text styling for a subtile.
  static const kCompanyNameHeading =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w800);

  static const kMargin = 12.0;

  static const kMarginLeftAndRight =
      EdgeInsets.only(left: kMargin, right: kMargin);

  static const kMarginAll = EdgeInsets.all(kMargin);

  final kStandardShadow = BoxShadow(
      spreadRadius: -10,
      blurRadius: 60,
      color: Colors.black.withOpacity(.20),
      offset: Offset(0, 15));

  static const kSmallFontSize = 12.0;
  static const kMediumFontSize = 14.0;
  static const kLargeFontSize = 17.0;
  static const kSuperSmallFontSize = 10.0;
}
