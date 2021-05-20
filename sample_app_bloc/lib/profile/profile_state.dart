part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileError extends ProfileState {
  final String message;
  ProfileError({@required this.message});
}

class ProfileLoaded extends ProfileState {
  final String batteryLife;

  ProfileLoaded({@required this.batteryLife});
}
