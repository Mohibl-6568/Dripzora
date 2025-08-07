import 'package:flutter/material.dart';

class SharedImageBackground extends StatelessWidget {
  final bool showLeftHalf;
  final Widget child;

  const SharedImageBackground({
    super.key,
    required this.showLeftHalf,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Shared image background
        Positioned.fill(
          child: Hero(
            tag: 'sharedBackgroundImage',
            child: Image.asset(
              'assets/images/startingimg.png',
              fit: BoxFit.cover,
              alignment: showLeftHalf
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
            ),
          ),
        ),

        // Gradient overlay
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.7),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),

        // Content
        child,
      ],
    );
  }
}
