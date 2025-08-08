import 'package:flutter/material.dart';
import 'package:dripzora/DATA_STRUCTURE/item_structure.dart';
import '../WIDGETS/squarewidget.dart';
import '../WIDGETS/rectanglewidget.dart';
import 'profile_page.dart';
import '../DATA_STRUCTURE/user_structure.dart';

class ExplorePage extends StatefulWidget {
  final UserStructure user;
  const ExplorePage({super.key, required this.user});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final List<ItemStructure> allItems = itemStructures;

  void _onHeartPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Added to Favorites! ❤️'),
        duration: Duration(milliseconds: 800),
      ),
    );
  }

  void _onProfilePressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage(user: widget.user)),
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
      backgroundColor: const Color(0xFF121212),
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
                  fillColor: Colors.grey[850],
                  prefixIcon: const Icon(Icons.search, color: Colors.white54),
                  suffixIcon: const Icon(Icons.mic, color: Colors.white54),
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
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: List.generate(allItems.length, (index) {
                            if (index % 3 == 0) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Rectanglewidget(item: allItems[index]),
                              );
                            }
                            return const SizedBox.shrink();
                          }),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: List.generate(allItems.length, (index) {
                            if (index % 3 == 1) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Squarewidget(item: allItems[index]),
                              );
                            }
                            return const SizedBox.shrink();
                          }),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: List.generate(allItems.length, (index) {
                            if (index % 3 == 2) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Rectanglewidget(item: allItems[index]),
                              );
                            }
                            return const SizedBox.shrink();
                          }),
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
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF1E1E1E),
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
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => ExplorePage(user: widget.user),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.favorite_border,
                color: Color.fromARGB(255, 229, 57, 53),
              ),
              onPressed: _onHeartPressed,
            ),
            const SizedBox(width: 48),
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
        backgroundColor: const Color.fromRGBO(255, 0, 255, 1),
        onPressed: () {
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
