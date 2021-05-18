import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:sample_app_bloc/sample_app_bloc.dart';
import 'package:sample_app_core/sample_app_core.dart';
import 'package:sample_loyalty_app/src/widgets/components/empty_screen.dart';
import 'package:sample_loyalty_app/src/widgets/news/news_components.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kScaffoldBackground,
        body: OfflineBuilder(
            child: Container(),
            connectivityBuilder: (
              context,
              connectivity,
              child,
            ) {
              return connectivity == ConnectivityResult.none
                  ? _buildNoConnectionMessage(context)
                  : _buildContent(context);
            }));
  }

  Widget _buildNoConnectionMessage(context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 14, left: 24, right: 24),
      child: EmptyScreen(
          message: 'Looks like you don\'t have an internet connection.'),
    );
  }

  Widget _buildContent(context) {
    return RefreshIndicator(
      child: SafeArea(
          child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              children: [
            NewsComponentWiget(
              onPressItem: () =>
                  Navigator.pushNamed(context, AppRoutes.detailArticle),
            )
          ])),
      onRefresh: () async {
        // Reload markets section.
        context.read<NewsBloc>().add(FetchNews());
      },
    );
  }
}
