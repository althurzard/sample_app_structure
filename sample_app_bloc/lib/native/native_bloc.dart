import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sample_native_bridge/sample_native_bridge.dart';

part 'native_state.dart';
part 'native_event.dart';

class NativeBloc extends Bloc<NativeEvent, NativeState> {
  NativeBloc() : super(NativeInitial());

  @override
  Stream<NativeState> mapEventToState(NativeEvent event) async* {
    if (event is GetBatteryLife) {
      yield* getBatteryLife();
    }
    if (event is GetNativeTextInput) {
      yield* openNativeInputText();
    }
  }

  Stream<NativeState> getBatteryLife() async* {
    try {
      final batteryLife = await NativeBridge.getBatteryLevel();
      yield BatteryLoaded(batteryLife: batteryLife);
    } catch (e) {
      yield NativeError(message: e.message);
    }
  }

  Stream<NativeState> openNativeInputText() async* {
    try {
      final text = await NativeBridge.openInputTextScreen();
      yield NativeTextLoaded(textInput: text);
    } catch (e) {
      yield NativeError(message: e.message);
    }
  }
}
