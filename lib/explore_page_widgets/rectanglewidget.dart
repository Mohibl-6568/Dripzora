import 'package:flutter/material.dart';
import 'package:dripzora/data_structure/item_structure.dart';

class Rectanglewidget extends StatelessWidget {
  final ItemStructure item;
  const Rectanglewidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 2, // A tall rectangle
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), // Consistent corner radius
        child: Image.asset(item.imagePaths[0], fit: BoxFit.cover),
      ),
    );
  }
}
