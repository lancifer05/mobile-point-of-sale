import 'package:flutter/material.dart';

import 'components/card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // Get the screen width to determine the Flex direction
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xffF6F6F6),
          child: Stack(
            children: [
              // Positioned card background
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: CardBackground(
                  child: Container(
                    height: screenWidth < 600 ? 150 : 100,
                    color: const Color(0xFF3F52E3),
                  ),
                ),
              ),
              // Content below the card background
              Column(
                children: [
                  // Responsive Flex layout
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final isVerticalLayout = constraints.maxWidth < 600;

                        return Flex(
                          direction: isVerticalLayout
                              ? Axis.vertical
                              : Axis.horizontal,
                          children: [
                            Container(
                              height: 120,
                              child: const Row(),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    width: isVerticalLayout ? 290 : 400,
                                    height: 70,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xffF6F6F6),
                                            width: 2.0,
                                          ),
                                        ),
                                        hintText: "Search",
                                        hintStyle: TextStyle(
                                          color: Color.fromARGB(255, 7, 7, 7),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenWidth < 600 ? 0 : 35),

                                  // Scrollable content
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth < 600
                                              ? 25
                                              : 0), // Adjust the value as needed
                                      child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              screenWidth > 600 ? 6 : 2,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 15.0,
                                        ),
                                        itemCount: 20,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            child: const Padding(
                                              padding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Cards(
                                                  height: 11120, width: 11120),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  )

                                  // Scrollable content end
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardBackground extends StatelessWidget {
  final Widget child;
  final double borderRadius;

  CardBackground({required this.child, this.borderRadius = 30.0});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Material(
      elevation: 4, // You can adjust the elevation as needed
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(screenWidth < 600 ? borderRadius : 0),
        bottomRight: Radius.circular(screenWidth < 600 ? borderRadius : 0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(screenWidth < 600 ? borderRadius : 0),
          bottomRight: Radius.circular(screenWidth < 600 ? borderRadius : 0),
        ),
        child: Container(
          color: const Color(0xFFFFC436),
          child: child,
        ),
      ),
    );
  }
}
