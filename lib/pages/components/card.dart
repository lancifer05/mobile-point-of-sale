import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  final double height;
  final double width;

  const Cards({super.key, required this.height, required this.width});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: widget.height, // Access height from widget
        width: widget.width,   // Access width from widget
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(25.0), // Corner radius
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(1.0),
              offset: Offset(0, 4),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("yah man"),
          ],
        ),
      ),
    );
  }
}
