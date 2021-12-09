import 'package:flutter/material.dart';

class FilterProductWidget extends StatelessWidget {
  const FilterProductWidget({
    Key? key,
    required this.categories,
    this.onCategorySelected,
  }) : super(key: key);

  final Function(String)? onCategorySelected;
  final List<String> categories;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          categories.length,
          (index) {
            final category = categories[index];
            return ListTile(
              title: Text(category),
              onTap: () => (onCategorySelected != null)
                  ? onCategorySelected!(category)
                  : null,
            );
          },
        ),
      );
}
