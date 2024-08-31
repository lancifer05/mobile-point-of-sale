import 'package:flutter/material.dart';

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
        body: Container(
      color: Color(0xffF6F6F6),
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
              // Responsive Flex layout
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final screenWidth = constraints.maxWidth;

                    return Flex(
                      direction:
                          screenWidth < 600 ? Axis.vertical : Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            color: const Color.fromARGB(13, 255, 193, 7),
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Container(

                                    padding: EdgeInsets.all(10),
                                    width: (screenWidth < 600 ? 250 : 400),
                                    height: 60,
                                    child: Center(
                                      child: TextFormField(
                                      decoration: const InputDecoration(
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffF6F6F6),
                                                width:
                                                    2.0), // Yellow border color and width
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffF6F6F6),
                                                width:
                                                    2.0), // Yellow border color when focused
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffF6F6F6),
                                                width:
                                                    2.0), // Yellow border color when enabled
                                          ),
                                          hintText: "Search",
                                          hintStyle: TextStyle(
                                              color:Color(0xffF6F6F6))),
                                    ),
                                    )
                                  )
                                ],
                              ),
                            ),
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
    ));
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
