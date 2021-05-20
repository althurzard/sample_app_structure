part of 'native_bloc.dart';

@immutable
abstract class NativeEvent {}

class GetBatteryLife extends NativeEvent {}

class GetNativeTextInput extends NativeEvent {}
