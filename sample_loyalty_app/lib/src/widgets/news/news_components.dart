import 'package:flutter/material.dart';
import 'package:sample_app_bloc/sample_app_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app_core/sample_app_core.dart';
import 'package:sample_loyalty_app/src/widgets/components/empty_screen.dart';
import 'package:sample_loyalty_app/src/widgets/components/hot_card.dart';
import 'package:sample_loyalty_app/src/widgets/components/loading_indicator.dart';
import 'package:sample_loyalty_app/src/widgets/components/see_more.dart';
import 'package:sample_loyalty_app/src/widgets/components/small_card.dart';

class NewsComponentWiget extends StatelessWidget {
  final Function onPressItem;
  const NewsComponentWiget({Key key, this.onPressItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsInitial) {
          context.read<NewsBloc>().add(FetchNews());
        }

        if (state is NewsError) {
          return Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
            child: EmptyScreen(message: state.message),
          );
        }

        if (state is NewsLoaded) {
          var width = MediaQuery.of(context).size.width * 0.7;
          var height = width * 6 / 4;
          var hotNews = state.hotNews.take(5).toList();
          var localNews = state.localNews;
          return Column(
            children: <Widget>[
              Container(
                height: height,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hotNews.length + 1,
                    itemBuilder: (BuildContext context, int index) =>
                        index < hotNews.length
                            ? Padding(
                                padding: EdgeInsets.only(
                                    right: AppStyles.kMargin / 2,
                                    left: AppStyles.kMargin),
                                child: GestureDetector(
                                  child: HotCard(
                                    item: hotNews[index],
                                    width: width,
                                    height: height,
                                  ),
                                  onTap: this.onPressItem,
                                ),
                              )
                            : SeeMore(
                                width: width,
                                height: height,
                              )),
              ),
              ...localNews
                  .asMap()
                  .map((index, item) => MapEntry(
                      index,
                      Padding(
                          padding: AppStyles.kMarginAll,
                          child: GestureDetector(
                            child: SmallCard(
                              item: item,
                            ),
                            onTap: this.onPressItem,
                          ))))
                  .values
                  .toList()
            ],
          );
        }
        return Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 3, left: 4, right: 4),
          child: LoadingIndicatorWidget(),
        );
      },
    );
  }
}