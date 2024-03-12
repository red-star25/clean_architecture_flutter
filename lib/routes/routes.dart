import 'package:clean_architecture_bloc/features/counter/presentation/cubit/counter_cubit.dart';
import 'package:clean_architecture_bloc/features/counter/presentation/pages/counter_page.dart';
import 'package:clean_architecture_bloc/features/news/presentation/cubit/news_cubit.dart';
import 'package:clean_architecture_bloc/features/news/presentation/pages/news_page.dart';
import 'package:clean_architecture_bloc/routes/paths.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Paths.counterPage,
  routes: [
    GoRoute(
      path: Paths.counterPage,
      builder: (context, state) => BlocProvider(
        create: (context) => CounterCubit()..getCount(count: 0),
        child: const CounterPage(),
      ),
    ),
    GoRoute(
      path: Paths.newsPage,
      builder: (context, state) => BlocProvider(
        create: (context) => NewsCubit()..getNews(),
        child: const NewsPage(),
      ),
    ),
  ],
);
