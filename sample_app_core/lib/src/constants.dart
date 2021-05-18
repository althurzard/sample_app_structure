import 'dart:io';

bool get isAndroid {
  return Platform.isAndroid;
}

final bool isDebug = true; // bool.fromEnvironment("dart.vm.product")
