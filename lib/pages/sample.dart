import 'package:flutter/material.dart';

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  @override
  Widget build(BuildContext context) {
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