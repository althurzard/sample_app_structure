import 'package:flutter/material.dart';
import 'package:sample_app_core/sample_app_core.dart';
import 'package:sample_app_repository/sample_app_repository.dart';

class HotCard extends StatelessWidget {
  final NewsEnity item;
  final double width;
  final double height;
  const HotCard(
      {Key key,
      @required this.item,
      @required this.width,
      @required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myLocale = Localizations.localeOf(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: AppStyles.kCardBorder,
          image: DecorationImage(
            image: NetworkImage(item.medias.first),
            fit: BoxFit.cover,
          )),
      child: Stack(
        children: [
          Positioned(
              bottom: AppStyles.kMargin,
              left: AppStyles.kMargin,
              right: AppStyles.kMargin,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: AppStyles.kCardBorder),
                child: Padding(
                  padding: AppStyles.kMarginAll,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                            fontSize: AppStyles.kLargeFontSize,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: AppStyles.kMargin / 2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.categories.first,
                              style: TextStyle(
                                  color: AppColors.kBlueColor,
                                  fontSize: AppStyles.kSmallFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              item.formattedPublished(myLocale.languageCode),
                              style: TextStyle(
                                  color: AppColors.kGray,
                                  fontSize: AppStyles.kSmallFontSize,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
