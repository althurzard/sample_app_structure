import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sample_native_bridge/sample_native_bridge.dart';

part 'profile_state.dart';
part 'profile_event.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is GetBatteryLife) {
      yield* getBatteryLife();
    }
  }

  Stream<ProfileState> getBatteryLife() async* {
    try {
      final batteryLife = await getBatteryLevel();
      yield ProfileLoaded(batteryLife: batteryLife);
    } catch (e) {
      yield ProfileError(message: e.message);
    }
  }
}
