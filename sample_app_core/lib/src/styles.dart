import 'package:flutter/material.dart';

class AppColors {
  static const kPrimaryColor = const Color(0xFF506DF5);
  static const kPrimaryVariantColor = const Color(0xFF264cf2);
  static const kPrimaryLightColor = const Color(0xFF879bf8);
  static const kPrimaryLigterColor = const Color(0xFFe7ebfe);

  static const kTileColor = const Color(0xff505050);

  static const kNegativeColor = Color(0xFFF44336);
  static const kPositiveColor = const Color(0XFF17a862);

  static const kLightGray = const Color(0XFFcdcdcd);
  static const kLighterGray = const Color(0XFF898989);
  static const kGray = const Color(0XFF757575);
  static const kBGGray = const Color(0xFF444044);
  var kSecondaryGray = Colors.grey[200];

  static const kScaffoldBackground = const Color(0XFFF8FCFF);
  static const kTransparentWhite = const Color(0X88ffffff);

  static const Color kRedColor = Color(0xFFFD2446);
  static const Color kGreenColor = Color(0xFF00C48C);
  static const Color kBlueColor = Color(0xFF5BBDF5);
}

class AppStyles {
  /// This is the common border radious of all the containers in the app.
  static const kStandardBorder = const BorderRadius.all(Radius.circular(6));

  /// This is the common border radious of all the containers in the app.
  static const kCardBorder = const BorderRadius.all(Radius.circular(10));

  /// This border is slightly more sharp than the standard boder.
  static const kSharpBorder = const BorderRadius.all(Radius.circular(2));

  /// This is the common text styling for a subtile.
  static const kSubtitleStyling = const TextStyle(
      color: AppColors.kGray, fontSize: 24, fontWeight: FontWeight.w800);

  /// This is the common text styling for a subtile.
  static const kCompanyNameHeading =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w800);

  static const kMargin = 12.0;

  static const kMarginLeftAndRight =
      const EdgeInsets.only(left: kMargin, right: kMargin);

  static const kMarginAll = const EdgeInsets.all(kMargin);

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
