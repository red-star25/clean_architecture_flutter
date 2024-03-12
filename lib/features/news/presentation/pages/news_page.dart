import 'package:clean_architecture_bloc/features/news/presentation/cubit/news_state.dart';
import 'package:clean_architecture_bloc/features/news/presentation/widgets/news_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base/base_state.dart';
import '../cubit/news_cubit.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: BlocBuilder<NewsCubit, BaseState>(
        builder: (context, state) {
          if (state is NewsSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: RefreshIndicator(
                onRefresh: () async =>
                    await context.read<NewsCubit>().getNews(),
                child: ListView.separated(
                  itemCount: state.newsEntity.articles?.length ?? 0,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 30,
                      color: Colors.grey.withOpacity(.3),
                      endIndent: 30,
                      indent: 30,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    final news = state.newsEntity.articles?[index];
                    return NewsItem(news: news);
                  },
                ),
              ),
            );
          } else if (state is NewsError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is StateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
