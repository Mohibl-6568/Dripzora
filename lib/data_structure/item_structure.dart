import 'package:flutter/material.dart';

class ItemStructure {
  String title;
  String description;
  List<String> imagePaths;
  List<Color> colors;
  double price;

  ItemStructure({
    required this.title,
    required this.description,
    required this.imagePaths,
    required this.colors,
    required this.price,
  });
}

List<ItemStructure> itemStructures = [
  ItemStructure(
    title: 'Nature',
    description: 'Beautiful landscapes and nature photography.',
    imagePaths: [
      'assets/images/1/1-1.jpg',
      'assets/images/1/1-2.png',
      'assets/images/1/1-3.png',
      'assets/images/1/1-4.png',
      'assets/images/1/1-5.png',
    ],
    colors: [Colors.green, Colors.blue, Colors.brown],
    price: 15.99,
  ),
  ItemStructure(
    title: 'Urban',
    description: 'Cityscapes and urban exploration.',
    imagePaths: [
      'assets/images/2/2-1.jpg',
      'assets/images/2/2-2.png',
      'assets/images/2/2-3.png',
      'assets/images/2/2-4.png',
      'assets/images/2/2-5.png',
    ],
    colors: [Colors.grey, Colors.blueGrey, Colors.black],
    price: 15.99,
  ),
  ItemStructure(
    title: 'Wildlife',
    description: 'Animals in their natural habitats.',
    imagePaths: [
      'assets/images/3/3-1.jpg',
      'assets/images/3/3-2.png',
      'assets/images/3/3-3.png',
      'assets/images/3/3-4.png',
    ],
    colors: [Colors.brown, Colors.orange, Colors.green],
    price: 15.99,
  ),
  ItemStructure(
    title: 'Abstract',
    description: 'Creative abstract art and patterns.',
    imagePaths: [
      'assets/images/4/4-1.png',
      'assets/images/4/4-2.png',
      'assets/images/4/4-3.png',
    ],
    colors: [Colors.purple, Colors.indigo, Colors.pink],
    price: 15.99,
  ),
  ItemStructure(
    title: 'Minimalism',
    description: 'Simple and clean minimalistic designs.',
    imagePaths: ['assets/images/5/5-1.png', 'assets/images/5/5-2.png'],
    colors: [Colors.white, Colors.black, Colors.grey],
    price: 15.99,
  ),
  ItemStructure(
    title: 'Technology',
    description: 'Modern technology and gadgets.',
    imagePaths: [
      'assets/images/6/6-1.png',
      'assets/images/6/6-2.png',
      'assets/images/6/6-3.png',
    ],
    colors: [Colors.blue, Colors.cyan, Colors.teal],
    price: 15.99,
  ),
  ItemStructure(
    title: 'Food',
    description: 'Delicious food and culinary art.',
    imagePaths: [
      'assets/images/7/7-1.png',
      'assets/images/7/7-2.png',
      'assets/images/7/7-3.png',
    ],
    colors: [Colors.red, Colors.orange, Colors.yellow],
    price: 15.99,
  ),
  ItemStructure(
    title: 'Travel',
    description: 'Exotic travel destinations and adventures.',
    imagePaths: [
      'assets/images/8/8-1.jpg',
      'assets/images/8/8-2.jpg',
      'assets/images/8/8-3.jpg',
      'assets/images/8/8-4.jpg',
    ],
    colors: [Colors.blue, Colors.amber, Colors.green],
    price: 15.99,
  ),
  ItemStructure(
    title: 'Sports',
    description: 'Exciting sports moments and athletes.',
    imagePaths: [
      'assets/images/9/9-1.jpg',
      'assets/images/9/9-2.jpg',
      'assets/images/9/9-3.jpg',
      'assets/images/9/9-4.jpg',
      'assets/images/9/9-5.jpg',
    ],
    colors: [Colors.green, Colors.red, Colors.blue],
    price: 15.99,
  ),
  ItemStructure(
    title: 'Vintage',
    description: 'Classic and vintage photography.',
    imagePaths: [
      'assets/images/10/10-1.jpg',
      'assets/images/10/10-2.jpg',
      'assets/images/10/10-3.jpg',
      'assets/images/10/10-4.jpg',
      'assets/images/10/10-5.jpg',
    ],
    colors: [Colors.brown, Colors.amber, Colors.grey],
    price: 15.99,
  ),
  ItemStructure(
    title: 'Portraits',
    description: 'Expressive portraits and people.',
    imagePaths: [
      'assets/images/11/11-1.jpg',
      'assets/images/11/11-2.jpg',
      'assets/images/11/11-3.jpg',
    ],
    colors: [Colors.pink, Colors.blueGrey, Colors.deepPurple],
    price: 15.99,
  ),
  ItemStructure(
    title: 'Macro',
    description: 'Close-up macro photography.',
    imagePaths: [
      'assets/images/12/12-1.jpg',
      'assets/images/12/12-2.jpg',
      'assets/images/12/12-3.jpg',
    ],
    colors: [Colors.green, Colors.lime, Colors.teal],
    price: 15.99,
  ),
  ItemStructure(
    title: 'Nightlife',
    description: 'Vibrant nightlife and city lights.',
    imagePaths: [
      'assets/images/13/13-1.jpg',
      'assets/images/13/13-2.jpg',
      'assets/images/13/13-3.jpg',
    ],
    colors: [Colors.deepPurple, Colors.indigo, Colors.black],
    price: 15.99,
  ),
  ItemStructure(
    title: 'Festivals',
    description: 'Colorful festivals and celebrations.',
    imagePaths: [
      'assets/images/14/14-1.jpg',
      'assets/images/14/14-2.jpg',
      'assets/images/14/14-3.jpg',
    ],
    colors: [Colors.orange, Colors.pink, Colors.yellow],
    price: 15.99,
  ),
  ItemStructure(
    title: 'Miscellaneous',
    description: 'A variety of unique and interesting images.',
    imagePaths: [
      'assets/images/15/15-1.jpg',
      'assets/images/15/15-2.jpg',
      'assets/images/15/15-3.jpg',
    ],
    colors: [Colors.blueGrey, Colors.cyan, Colors.deepOrange],
    price: 15.99,
  ),
];
