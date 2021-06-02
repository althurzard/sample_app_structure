import 'package:flutter/material.dart';
import 'package:sample_app_bloc/sample_app_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app_core/sample_app_core.dart';
import 'package:sample_loyalty_app/src/widgets/components/empty_screen.dart';
import 'package:sample_loyalty_app/src/widgets/components/loading_indicator.dart';
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
          var localNews = state.localNews;
          return Column(
            children: <Widget>[
              ...localNews
                  .asMap()
                  .map((index, item) => MapEntry(
                      index,
                      Padding(
                          padding: AppStyles.kMarginAll,
                          child: GestureDetector(
                            onTap: onPressItem,
                            child: SmallCard(
                              item: item,
                            ),
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
