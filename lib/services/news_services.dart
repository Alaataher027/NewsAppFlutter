import 'package:dio/dio.dart';
import 'package:news_flutter/models/article_model.dart';

class NewsServices {
  final Dio dio;

  NewsServices(this.dio);
  // ArticleModel articleModel;

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=56faf21731a94b4ca4ebe06944f951ab&category=$category');

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData["articles"];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
            image: article['urlToImage'],
            title: article["title"],
            subtitle: article["description"],
            url: article["url"]);

        articlesList.add(articleModel);
      }

      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
    // List<Map<String, dynamic>> articles =
    //     jsonData["articles"] as List<Map<String, dynamic>>;