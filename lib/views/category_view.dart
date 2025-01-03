import 'package:flutter/material.dart';
import 'package:news_flutter/widgets/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.categoryName});

  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
        child: CustomScrollView(
          slivers: [
            NewsListViewBuilder(
              categoryName: categoryName,
            ),
          ],
        ),
      ),
    );
  }
}
