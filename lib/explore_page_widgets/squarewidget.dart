import 'package:flutter/material.dart';
import 'package:dripzora/data_structure/item_structure.dart';

class Squarewidget extends StatelessWidget {
  final ItemStructure item;
  const Squarewidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1, // Ensures the widget is always a square
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15), // Consistent corner radius
        child: Image.asset(item.imagePaths[0], fit: BoxFit.cover),
      ),
    );
  }
}
