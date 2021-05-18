import 'package:sample_app_core/src/constants.dart';

class Configs {
  static String get appDomain {
    return isDebug
        ? (isAndroid
            ? "bullishsignal.herokuapp.com"
            : "bullishsignal.herokuapp.com")
        : "bullishsignal.herokuapp.com";
  }
}
