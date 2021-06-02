import 'package:flutter/material.dart';

abstract class JSONable {
  Map<String, dynamic> toJson();
}

abstract class AuthSessionInterface implements JSONable {
  String accessToken;
  String phoneNumber;
}

class AuthSessionInfo implements AuthSessionInterface {
  String accessToken;
  String phoneNumber;
  AuthSessionInfo({@required this.accessToken, @required this.phoneNumber});

  factory AuthSessionInfo.fromJson(Map<String, dynamic> json) {
    return AuthSessionInfo(
        accessToken: json['accessToken'], phoneNumber: json['phoneNumber']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {'accessToken': accessToken, 'phoneNumber': phoneNumber};
  }
}
