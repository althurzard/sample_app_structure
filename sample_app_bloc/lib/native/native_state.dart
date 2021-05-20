part of 'native_bloc.dart';

@immutable
abstract class NativeState {}

class NativeInitial extends NativeState {}

class BatteryLoaded extends NativeState {
  final String batteryLife;

  BatteryLoaded({@required this.batteryLife});
}

class NativeTextLoaded extends NativeState {
  final String textInput;

  NativeTextLoaded({@required this.textInput});
}

class NativeError extends NativeState {
  final String message;
  NativeError({@required this.message});
}
