import 'package:flutter/material.dart';
import 'package:sample_app_core/sample_app_core.dart';
import 'package:sample_app_bloc/sample_app_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _batteryTextWiget(context),
              TextButton(
                  onPressed: () =>
                      context.read<NativeBloc>().add(GetBatteryLife()),
                  child: Container(
                    color: AppColors.kBlueColor,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Get battery life',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
              _nativeTextInputWidget(context),
              TextButton(
                  onPressed: () =>
                      context.read<NativeBloc>().add(GetNativeTextInput()),
                  child: Container(
                    color: AppColors.kBlueColor,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Open Native Text Input',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }

  Widget _batteryTextWiget(context) {
    return BlocBuilder<NativeBloc, NativeState>(
      buildWhen: (current, next) {
        return (current is BatteryLoaded && next is BatteryLoaded) ||
            (current.runtimeType != BatteryLoaded && next is BatteryLoaded);
      },
      builder: (context, state) {
        var text = '';
        if (state is BatteryLoaded) {
          text = state.batteryLife;
        }
        return Text(text);
      },
    );
  }

  Widget _nativeTextInputWidget(context) {
    return BlocBuilder<NativeBloc, NativeState>(
      buildWhen: (current, next) {
        return (current is NativeTextLoaded && next is NativeTextLoaded) ||
            (current.runtimeType != NativeTextLoaded &&
                next is NativeTextLoaded);
      },
      builder: (context, state) {
        var text = '';
        if (state is NativeTextLoaded) {
          text = state.textInput;
        }
        return Text(text);
      },
    );
  }
}
