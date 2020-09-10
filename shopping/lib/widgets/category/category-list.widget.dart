import 'package:flutter/material.dart';

import 'category-item.widget.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryItem(image: "assets/Icon_Devices.png"),
          CategoryItem(image: "assets/Icon_Gadgets.png"),
          CategoryItem(image: "assets/Icon_Gaming.png"),
          CategoryItem(image: "assets/Icon_Mens_Shoe.png"),
          CategoryItem(image: "assets/Icon_Womens_Shoe.png"),
        ],
      ),
    );
  }
}
