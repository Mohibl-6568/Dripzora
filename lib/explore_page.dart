import 'package:flutter/material.dart';
import 'package:dripzora/data_structure/item_structure.dart';
import 'explore_page_widgets/squarewidget.dart';
import 'explore_page_widgets/rectanglewidget.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});
  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

List<ItemStructure> items = itemStructures;

class _ExplorePageState extends State<ExplorePage> {
  final List<Widget> leftColumn = [];
  final List<Widget> midColumn = [];
  final List<Widget> rightColumn = [];

  void splitItemsIntoColumns() {
    leftColumn.clear();
    midColumn.clear();
    rightColumn.clear();

    int index = 0;
    int leftIndex = 1;
    int rightIndex = 0;

    while (index < items.length) {
      // LEFT COLUMN
      if (index < items.length) {
        if (leftIndex % 3 != 0) {
          leftColumn.add(Squarewidget(item: items[index]));
        } else {
          leftColumn.add(Rectanglewidget(item: items[index]));
        }
        index++;
        leftIndex++;
      }

      // MID COLUMN (Always square)
      if (index < items.length) {
        midColumn.add(Squarewidget(item: items[index]));
        index++;
      }

      // RIGHT COLUMN
      if (index < items.length) {
        if (rightIndex == 0 || rightIndex % 3 == 0) {
          rightColumn.add(Rectanglewidget(item: items[index]));
        } else {
          rightColumn.add(Squarewidget(item: items[index]));
        }
        index++;
        rightIndex++;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    splitItemsIntoColumns();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double columnWidth = screenWidth / 3;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              // Search bar
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.grey[900],
                  prefixIcon: const Icon(Icons.search, color: Colors.white54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Unified vertical scroll for all three columns
              Expanded(
                child: SingleChildScrollView(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: columnWidth,
                        child: Column(children: leftColumn),
                      ),
                      SizedBox(
                        width: columnWidth,
                        child: Column(children: midColumn),
                      ),
                      SizedBox(
                        width: columnWidth,
                        child: Column(children: rightColumn),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
