import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  final double height;
  final double width;
  final String imagePath;
  final String itemName;
  final bool imageAsBackground;
  final ValueChanged<int> onValueChange; // New parameter for the callback

  const Cards({
    super.key,
    required this.height,
    required this.width,
    required this.imagePath,
    required this.itemName,
    this.imageAsBackground = false,
    required this.onValueChange, // Include the callback in the constructor
  });

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  final TextEditingController _counterController = TextEditingController();
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _counterController.text = '$_counter';
    _counterController.addListener(() {
      final newValue = int.tryParse(_counterController.text);
      if (newValue != null) {
        setState(() {
          _counter = newValue;
          widget.onValueChange(_counter); // Notify the callback on text change
        });
      }
    });
  }

  @override
  void dispose() {
    _counterController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _counterController.text = '$_counter';
      widget.onValueChange(_counter); // Notify the callback on increment
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
        _counterController.text = '$_counter';
        widget.onValueChange(_counter); // Notify the callback on decrement
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
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
                const SizedBox(height: 10),
                if (!widget.imageAsBackground)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset(
                      widget.imagePath,
                      height: widget.height * 0.6,
                      width: widget.width * 0.9,
                      fit: BoxFit.cover,
                    ),
                  ),
                Text(
                  widget.itemName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 10.0),
                    child: SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: _decrementCounter,
                            icon: const Icon(Icons.remove),
                          ),
                          SizedBox(
                            width: 60,
                            child: TextField(
                              controller: _counterController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          IconButton(
                            onPressed: _incrementCounter,
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_counter > 0)
            Positioned(
              top: -8,
              right: -3,
              child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF3F52E3).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$_counter',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
