import 'package:flutter/material.dart';
import 'package:p3_app_dev/pages/components/card.dart';

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
                height: (screenWidth < 600 ? 150 : 100),
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
                    final screenWidth = constraints.maxWidth;
                    return SingleChildScrollView(
                      child: Flex(
                        direction:
                            screenWidth < 600 ? Axis.vertical : Axis.horizontal,
                        children: <Widget>[
                          Container(
                            height: 120,
                            child: const Row(children: <Widget>[]),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  width: (screenWidth < 600 ? 290 : 400),
                                  height: 70,
                                  child: Center(
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
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xffF6F6F6),
                                            width: 2.0,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
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
                                ),
                                const Column(
                                  children: <Widget>[
                                    Cards(height: 200, width: 300),
                                    Cards(height: 200, width: 300),
                                    Cards(height: 200, width: 300),
                                    Cards(height: 200, width: 300),
                                    Cards(height: 200, width: 300),
                                    Cards(height: 200, width: 300),
                                    Cards(height: 200, width: 300),
                                    Cards(height: 200, width: 300),
                                    Cards(height: 200, width: 300),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
