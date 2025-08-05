import 'package:flutter/material.dart';
import 'package:dripzora/data_structure/item_structure.dart';

class Rectanglewidget extends StatelessWidget {
  final ItemStructure item;
  const Rectanglewidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    double containerSize = MediaQuery.of(context).size.width / 3;

    return Container(
      width: containerSize,
      height: containerSize * 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(item.imagePaths[0]),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
