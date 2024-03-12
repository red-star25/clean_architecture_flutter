import 'package:clean_architecture_bloc/features/news/domain/entities/news_entity.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
    required this.news,
  });

  final ArticlesEntity? news;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            news?.source?.name ?? '',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const Placeholder(
              fallbackHeight: 100,
              fallbackWidth: 100,
            ),
            const SizedBox(width: 20),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news?.title ?? '',
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 10),
                Text(
                  news?.author ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey),
                ),
                Text(
                  news?.publishedAt ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey),
                ),
              ],
            )),
          ],
        ),
      ],
    );
  }
}
