import 'package:flutter/material.dart';
import 'package:news_flutter/models/article_model.dart';
import 'package:news_flutter/widgets/news_tile.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articalesList;

  NewsListView({super.key, required this.articalesList});

  @override
  Widget build(BuildContext context) {
    // NewsServices(Dio()).getNews(); // مفيش حاجة تتحط هنا!!
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return NewsTile(
            articleModel: articalesList[index],
          );
        },
        childCount: articalesList.length,
      ),
    );
  }
}


    // return ListView.builder(
    //   physics: NeverScrollableScrollPhysics(),
    //   shrinkWrap: true, // هتخلى الليست فيو تتبنى مرة واحدة
    //   itemCount: 10,
    //   itemBuilder: (context, index) {
    //     return Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 8),
    //       child: NewsTile(),
    //     );
    //   },
    // );