import 'package:flutter/material.dart';
import 'package:sample_app_core/sample_app_core.dart';

class EmptyScreen extends StatelessWidget {
  final String message;

  EmptyScreen({this.message});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(
          height: 1.5,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.kGray),
      textAlign: TextAlign.start,
    );
  }
}
