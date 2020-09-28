import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kboy/data/category_info.dart';

class CategoryChipes extends StatefulWidget {

  final ValueChanged onCategorySelected;
  CategoryChipes({this.onCategorySelected});

  @override
  _CategoryChipesState createState() => _CategoryChipesState();
}

class _CategoryChipesState extends State<CategoryChipes> {
  var value = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4.0,
      children: List<Widget>.generate(categories.length, (int index){
        return ChoiceChip(
          label: Text(categories[index].nameJp),
          selected: value == index,
          onSelected: (bool isSelected){
            setState(() {
              value = isSelected ? index : 0;
              widget.onCategorySelected(categories[index]);
            });
          },
        );
    }
    ).toList()
    );
  }
}
