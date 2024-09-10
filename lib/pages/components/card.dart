import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  final double height;
  final double width;
  final String imagePath; // Parameter for the image asset path
  final bool imageAsBackground; // Attribute to set image as background

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
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
        _counterController.text = '$_counter';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Make sure the Material widget is transparent
      child: Stack(
        clipBehavior: Clip.none, // Allow the stack to overflow
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
                if (!widget.imageAsBackground) // Conditional logic to show image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset(
                      widget.imagePath,
                      height: widget.height * 0.6, // Adjust the height of the image
                      width: widget.width * 0.9, // Adjust the width of the image
                      fit: BoxFit.cover, // Cover the specified area with the image
                    ),
                  ),
                const Text(
                  "Cute Corgi",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Counter and buttons section
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                    child: SingleChildScrollView(  // Make the content scrollable to avoid overflow
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Decrement button
                          IconButton(
                            onPressed: _decrementCounter,
                            icon: const Icon(Icons.remove),
                          ),
                          // Counter display
                          SizedBox(
                            width: 60, // Adjust width as needed
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
                          // Increment button
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
          // Counter display in the top-right corner (only if counter > 0)
          if (_counter > 0)
            Positioned(
              top: -8, // Adjust the vertical position to prevent cropping
              right: -3, // Adjust the horizontal position to prevent cropping
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
