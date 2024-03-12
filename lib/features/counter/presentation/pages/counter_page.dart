import 'dart:math';

import 'package:clean_architecture_bloc/core/base/base.dart';
import 'package:clean_architecture_bloc/features/counter/presentation/cubit/counter_cubit.dart';
import 'package:clean_architecture_bloc/features/counter/presentation/cubit/counter_state.dart';
import 'package:clean_architecture_bloc/features/counter/presentation/widgets/counter_info_widget.dart';
import 'package:clean_architecture_bloc/routes/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
          onPressed: () {
            context.push(Paths.newsPage);
          },
          child: const Text('News'),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<CounterCubit>().getCount(count: Random().nextInt(100));
          },
          child: const Center(
            child: Icon(Icons.add),
          )),
      body: BlocBuilder<CounterCubit, BaseState>(
        builder: (context, state) {
          if (state is CounterInfoSucess) {
            return CounterInfoWidget(
              count: state.counterEntity.countInfo.toString().split(' ').first,
              info: state.counterEntity.countInfo.toString(),
            );
          } else if (state is CounterInfoError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
