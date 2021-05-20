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
        var text = '';
        if (state is ProfileLoaded) {
          text = state.batteryLife;
        }
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(text),
              TextButton(
                  onPressed: () =>
                      context.read<ProfileBloc>().add(GetBatteryLife()),
                  child: Container(
                    color: AppColors.kBlueColor,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Get battery life',
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
}
