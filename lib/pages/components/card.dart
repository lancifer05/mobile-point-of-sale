import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  final double height;
  final double width;
  final String imagePath; // Parameter for the image asset path
  final bool imageAsBackground; // New attribute to set image as background

  const Cards({
    super.key,
    required this.height,
    required this.width,
    required this.imagePath, // Add imagePath to constructor
    this.imageAsBackground = false, // Default is false
  });

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: const Offset(0, 4),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!widget.imageAsBackground) // Conditional logic to show image
              ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.asset(
                  widget.imagePath,
                  height: widget.height * 0.7, // Adjust the height of the image
                  width: widget.width * 0.9, // Adjust the width of the image
                  fit: BoxFit.cover, // Cover the specified area with the image
                ),
              ),
            const SizedBox(height: 10), // Spacing between image and text
            const Text(
              "Cute Corgi",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
