import 'package:flutter/material.dart';
import 'package:intern_task/presentation/widget/category_button.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({
    super.key,
  });

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  late int selectedCategory;
  List<String> categories = [
    'All',
    'Acer',
    'Razer',
    'Apple',
  ];

  @override
  void initState() {
    super.initState();
    selectedCategory = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 18.0),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryButton(
            btnText: categories[index],
            isSelected: selectedCategory == index,
            onTap: () {
              setState(() {
                selectedCategory = index;
              });
            },
          );
        },
      ),
    );
  }
}
