import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard(
      {required this.topLeft,
      required this.topRight,
      required this.bottomLeft,
      required this.bottomRight,
      required this.color,
      required this.image,
      required this.title,
      super.key});

  Radius topLeft;
  Radius topRight;
  Radius bottomLeft;
  Radius bottomRight;
  String image;
  String title;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topLeft: topLeft,
              topRight: topRight,
              bottomLeft: bottomLeft,
              bottomRight: bottomRight)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
