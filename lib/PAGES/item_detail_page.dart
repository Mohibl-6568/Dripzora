import 'package:flutter/material.dart';
import 'package:dripzora/DATA_STRUCTURE/item_structure.dart';

class ItemDetailPage extends StatefulWidget {
  final ItemStructure item;
  const ItemDetailPage({super.key, required this.item});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFF121212,
      ), // Dark background for a sleek look
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: Text(
          widget.item.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      // --- Floating Action Button ---
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 0, 255),
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
      // --- Main Page Content ---
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Swipeable images section
            SizedBox(
              height:
                  MediaQuery.of(context).size.height *
                  0.5, // 50% of screen height
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.item.imagePaths.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        widget.item.imagePaths[index],
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // Dots indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.item.imagePaths.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 12 : 8,
                  height: _currentPage == index ? 12 : 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? Colors.white
                        : Colors.white54,
                  ),
                );
              }),
            ),

            const SizedBox(height: 24),

            // Item details section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${widget.item.price.toStringAsFixed(2)}', // Assuming a price property exists
                    style: const TextStyle(
                      color: Color(0xFFE53935), // A distinct color for price
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.item.description,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Action button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE53935),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
