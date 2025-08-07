import 'package:flutter/material.dart';
import 'package:dripzora/data_structure/item_structure.dart';
import 'explore_page_widgets/squarewidget.dart';
import 'explore_page_widgets/rectanglewidget.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final List<ItemStructure> allItems = itemStructures;
  final List<ItemStructure> leftColumnItems = [];
  final List<ItemStructure> midColumnItems = [];
  final List<ItemStructure> rightColumnItems = [];

  @override
  void initState() {
    super.initState();
    splitItemsIntoColumns();
  }

  void splitItemsIntoColumns() {
    leftColumnItems.clear();
    midColumnItems.clear();
    rightColumnItems.clear();

    //int leftIndex = 0;
    //int midIndex = 0;
    //int rightIndex = 0;

    for (int i = 0; i < allItems.length; i++) {
      if (i % 3 == 0) {
        leftColumnItems.add(allItems[i]);
      } else if (i % 3 == 1) {
        midColumnItems.add(allItems[i]);
      } else {
        rightColumnItems.add(allItems[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              // Search bar with padding for a cleaner look
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
                child: TextField(
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
              ),

              // Aesthetic grid of items
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Column
                    Expanded(
                      child: ListView.builder(
                        itemCount: leftColumnItems.length,
                        itemBuilder: (context, index) {
                          // Dynamic sizing based on a simple pattern
                          if (index % 3 == 0) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Rectanglewidget(
                                item: leftColumnItems[index],
                              ),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Squarewidget(item: leftColumnItems[index]),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Mid Column
                    Expanded(
                      child: ListView.builder(
                        itemCount: midColumnItems.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Squarewidget(item: midColumnItems[index]),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Right Column
                    Expanded(
                      child: ListView.builder(
                        itemCount: rightColumnItems.length,
                        itemBuilder: (context, index) {
                          // Dynamic sizing based on a simple pattern
                          if (index % 2 == 0) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Squarewidget(
                                item: rightColumnItems[index],
                              ),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Rectanglewidget(
                              item: rightColumnItems[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
