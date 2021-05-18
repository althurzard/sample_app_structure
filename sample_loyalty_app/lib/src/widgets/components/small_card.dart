import 'package:flutter/material.dart';
import 'package:sample_app_core/sample_app_core.dart';
import 'package:sample_app_repository/sample_app_repository.dart';

class SmallCard extends StatelessWidget {
  final NewsEnity item;
  const SmallCard({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    return Container(
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: AppStyles.kCardBorder,
                  image: DecorationImage(
                    image: NetworkImage(item.medias.first),
                    fit: BoxFit.cover,
                  ))),
          Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: AppStyles.kMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        maxLines: 3,
                        style: TextStyle(
                            fontSize: AppStyles.kMediumFontSize,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      flex: 1,
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
              ))
        ],
      ),
    );
  }
}
