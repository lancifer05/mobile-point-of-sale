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
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final isVerticalLayout = constraints.maxWidth < 600;

                        return Flex(
                          direction: isVerticalLayout ? Axis.vertical : Axis.horizontal,
                          children: [
                            Container(
                              height: 120,
                              child: const Row(),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    width: isVerticalLayout ? 350 : 400,
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
                                  // Conditional spacing
                                  if (!isVerticalLayout) 
                                  const SizedBox(height: 35),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsetsDirectional.symmetric(
                                        horizontal: screenWidth < 600 ? 0 : 12),
                                      alignment: Alignment.center,
                                      width: screenWidth,
                                      child: SingleChildScrollView(
                                        child: Wrap(
                                          spacing: 10.0,
                                          runSpacing: 15.0,
                                          children: List.generate(100, (index) {
                                            return Container(
                                              padding: EdgeInsets.all(4),
                                              child: Cards(
                                                height: screenWidth < 600 ? 220 : 250,
                                                width: screenWidth < 600 ? 170 : 200,
                                                imagePath: 'assets/crogi.jpg',
                                              ),
                                            );
                                          }),
                                        ),
                                      ),
                                    ),
                                  ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Define the action when the button is pressed
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF3F52E3),
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
