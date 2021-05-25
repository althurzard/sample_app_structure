import 'package:flutter/material.dart';
import 'package:sample_app_core/sample_app_core.dart';

class DetailArticle extends StatelessWidget {
  const DetailArticle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Container(
        color: AppColors.kScaffoldBackground,
      ),
    );
  }
}
