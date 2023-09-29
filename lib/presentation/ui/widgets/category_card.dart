import 'package:flutter/material.dart';
import '../../../data/model/model_data/category_model_data.dart';
import '../utils/app_colors.dart';

class CategoryCard extends StatelessWidget {
  final CategoryData categoryData;
  const CategoryCard({
    super.key, required this.categoryData,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.network(categoryData.categoryImg ?? "",height: 70,width: 85,),
      ),
    );
  }
}