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
      body: Flex(
        direction: screenWidth < 600 ? Axis.vertical : Axis.horizontal,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.amber,
              child: const Center(
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Foo", style: TextStyle(fontSize: 24)),
                    Text("Bar", style: TextStyle(fontSize: 24)),
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
    );
  }
}
