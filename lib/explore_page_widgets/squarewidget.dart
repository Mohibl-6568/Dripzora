import 'package:flutter/material.dart';
import 'package:dripzora/data_structure/item_structure.dart';

class Squarewidget extends StatelessWidget {
  final ItemStructure item;
  const Squarewidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    double containerSize = MediaQuery.of(context).size.width / 3;

    return Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(item.imagePaths[0]),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
