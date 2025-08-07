import 'package:flutter/material.dart';
import 'package:dripzora/DATA_STRUCTURE/item_structure.dart';
import '../WIDGETS/squarewidget.dart';
import '../WIDGETS/rectanglewidget.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final List<ItemStructure> allItems = itemStructures;

  @override
  void initState() {
    super.initState();
  }

  // You can keep the `splitItemsIntoColumns` logic, but for a cleaner look,
  // we'll use a single list with a staggered grid view.
  // The original logic is good, but this example focuses on a different approach.

  void _onHeartPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Added to Favorites! ❤️'),
        duration: Duration(milliseconds: 800),
      ),
    );
  }

  void _onProfilePressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile button clicked'),
        duration: Duration(milliseconds: 800),
      ),
    );
  }

  void _onCartPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cart button clicked'),
        duration: Duration(milliseconds: 800),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // A deep, rich dark grey
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor:
                      Colors.grey[850], // Slightly lighter than background
                  prefixIcon: const Icon(Icons.search, color: Colors.white54),
                  suffixIcon: const Icon(
                    Icons.mic,
                    color: Colors.white54,
                  ), // A cool addition
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 20,
                  ),
                ),
              ),
            ),

            // Staggered Grid for items
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            // Column 1
                            ...List.generate(allItems.length, (index) {
                              if (index % 3 == 0) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Rectanglewidget(item: allItems[index]),
                                );
                              }
                              return const SizedBox.shrink(); // Hide other items
                            }).whereType<Widget>().toList(), // Filter out nulls
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            // Column 2
                            ...List.generate(allItems.length, (index) {
                              if (index % 3 == 1) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Squarewidget(item: allItems[index]),
                                );
                              }
                              return const SizedBox.shrink();
                            }).whereType<Widget>().toList(),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            // Column 3
                            ...List.generate(allItems.length, (index) {
                              if (index % 3 == 2) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Rectanglewidget(item: allItems[index]),
                                );
                              }
                              return const SizedBox.shrink();
                            }).whereType<Widget>().toList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar with floating action button
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF1E1E1E), // A slightly lighter dark grey
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                Icons.home_outlined,
                color: Color.fromARGB(255, 229, 57, 53),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.favorite_border,
                color: Color.fromARGB(255, 229, 57, 53),
              ),
              onPressed: _onHeartPressed,
            ),
            const SizedBox(width: 48), // Space for the FAB
            IconButton(
              icon: const Icon(
                Icons.person_outline,
                color: Color.fromARGB(255, 229, 57, 53),
              ),
              onPressed: _onProfilePressed,
            ),
            IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Color.fromARGB(255, 229, 57, 53),
              ),
              onPressed: _onCartPressed,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(
          255,
          0,
          255,
          255,
        ), // Vibrant red for an accent
        onPressed: () {
          // Action for the main button, e.g., posting a new item
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('FAB clicked!'),
              duration: Duration(milliseconds: 800),
            ),
          );
        },
        child: const Icon(Icons.camera, color: Colors.white),
      ),
    );
  }
}
