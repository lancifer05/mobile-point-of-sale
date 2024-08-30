import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 350,
              height: 150,
              child: Card(
                  child: Container(
                    padding:EdgeInsets.all(50),
                child: Column(
                  children: <Widget>[
                    Text("van ho ten"),
                  ],
                ),
              )),
            ),

            // Image(image: AssetImage("janedoe.jpg"))
          ],
        ),
      ),
    );
  }
}
