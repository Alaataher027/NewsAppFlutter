import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/models/article_model.dart';
import 'package:news_flutter/services/news_services.dart';
import 'package:news_flutter/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.categoryName});

  final String categoryName;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsServices(Dio()).getNews(category: widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(articalesList: snapshot.data!);
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Text("oops there was an error"),
            );
          } else {
            return SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}
  // List<ArticleModel> articalesList = [];
  // bool isLoading = true;
  // @override
  // void initState() {
  //   super.initState();
  //   getGeneralNews();
  // }

  // Future<void> getGeneralNews() async {
  //   articalesList = await NewsServices(Dio()).getNews();
  //   isLoading = false;
  //   setState(() {});
  // }
    // isLoading
    //     ? SliverToBoxAdapter(
    //         child: Center(child: CircularProgressIndicator()),
    //       )
    //     : articalesList.isNotEmpty
    //         ? NewsListView(articalesList: articalesList)
    //         : SliverToBoxAdapter(

    //             child: Text("oops there was an error"),
    //           );