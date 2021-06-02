import 'package:sample_app_core/src/constants.dart';

class Configs {
  static String get appDomain {
    return isDebug
        ? (isAndroid
            ? 'http://bullishsignal.herokuapp.com'
            : 'http://bullishsignal.herokuapp.com')
        : 'http://bullishsignal.herokuapp.com';
  }
}
