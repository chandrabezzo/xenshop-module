import 'package:flutter/material.dart';

class FilterProductWidget extends StatelessWidget {
  const FilterProductWidget({
    Key? key,
    this.onCategorySelected,
  }) : super(key: key);

  final Function(String)? onCategorySelected;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: List.generate(5, (index) => ListTile(
        title: Text('Category $index'),
        onTap: () => (onCategorySelected != null)
          ? onCategorySelected!('Category $index')
          : null,
      ),
    ),
  );
}
