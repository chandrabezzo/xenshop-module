import 'package:flutter/material.dart';

class FilterProductWidget extends StatelessWidget {
  const FilterProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: List.generate(5, (index) => ListTile(
        title: Text('Category $index'),
      ),
    ),
  );
}
