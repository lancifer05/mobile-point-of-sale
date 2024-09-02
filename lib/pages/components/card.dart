import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  final double height;
  final double width;

  const Cards({super.key, this.height = 120.0, this.width = 90.0});

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
        color: Colors.red,
        child: Column(
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
