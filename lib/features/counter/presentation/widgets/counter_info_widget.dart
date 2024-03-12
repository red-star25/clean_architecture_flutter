import 'package:flutter/material.dart';

class CounterInfoWidget extends StatelessWidget {
  const CounterInfoWidget({super.key, required this.count, required this.info});

  final String count;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              count,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              info,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
