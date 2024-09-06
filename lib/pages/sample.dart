import 'package:flutter/material.dart';
import 'dart:ui'; // Import for using ImageFilter

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  final OverlayPortalController _overlayController = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          if (_overlayController.isShowing) {
            _overlayController.toggle(); // Close the overlay when tapping outside
          }
        },
        child: Flex(
          direction: screenWidth < 600 ? Axis.vertical : Axis.horizontal,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () => _overlayController.toggle(),
                        child: const Text("Press it"),
                      ),
                      OverlayPortal(
                        controller: _overlayController,
                        overlayChildBuilder: (BuildContext context) {
                          return Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                // Prevents the overlay from closing when tapped inside
                              },
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 0.7, // Horizontal blur
                                  sigmaY: 0.7, // Vertical blur
                                ),
                                child: Container(
                                  width: screenWidth * 0.8, // 80% of screen width
                                  height: screenHeight * 0.3, // 30% of screen height
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Who Ever move first is A gay ",
                                      style: TextStyle(color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const Text("Foo", style: TextStyle(fontSize: 24)),
                      const Text("Bar", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.lightBlue,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Item 1", style: TextStyle(fontSize: 24)),
                      Text("Item 2", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
