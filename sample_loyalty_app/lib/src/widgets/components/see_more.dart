import 'package:flutter/material.dart';
import 'package:sample_app_core/sample_app_core.dart';

class SeeMore extends StatelessWidget {
  final double width;
  final double height;
  const SeeMore({Key key, @required this.width, @required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.subdirectory_arrow_right_sharp,
            color: AppColors.kPrimaryColor,
            size: 60,
          ),
          Text(
            'See More',
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
