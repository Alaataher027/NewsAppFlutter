import 'package:flutter/material.dart';
import 'package:news_flutter/models/category_model.dart';
import 'package:news_flutter/views/category_view.dart';
import 'package:news_flutter/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  final List<CategoryModel> categoriesModelList = const [
    CategoryModel(categoryName: "Technology", image: "assets/technology.jpeg"),
    CategoryModel(
        categoryName: "Entertainment", image: "assets/entertaiment.avif"),
    CategoryModel(categoryName: "General", image: "assets/general.avif"),
    CategoryModel(categoryName: "Health", image: "assets/health.avif"),
    CategoryModel(categoryName: "Science", image: "assets/science.avif"),
    CategoryModel(categoryName: "Sports", image: "assets/sports.avif"),
    CategoryModel(categoryName: "Business", image: "assets/business.avif"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesModelList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to CategoryView with the selected category
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryView(
                    categoryName: categoriesModelList[index].categoryName,
                  ),
                ),
              );
            },
            child: CategoryCard(
              categoryModel: categoriesModelList[index],
            ),
          );
        },
      ),
    );
  }
}
