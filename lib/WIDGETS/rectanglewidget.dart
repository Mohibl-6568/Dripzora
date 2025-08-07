import 'package:flutter/material.dart';
import 'package:dripzora/DATA_STRUCTURE/item_structure.dart';
import 'package:dripzora/PAGES/item_detail_page.dart';

class Rectanglewidget extends StatelessWidget {
  final ItemStructure item;
  const Rectanglewidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ItemDetailPage(item: item)),
        );
      },
      child: AspectRatio(
        aspectRatio: 1 / 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(item.imagePaths[0], fit: BoxFit.cover),
        ),
      ),
    );
  }
}
