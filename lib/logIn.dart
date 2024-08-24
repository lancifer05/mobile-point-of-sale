import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: <Widget>[
          Text("Niiiiiigaaaa"),
          Row(
            children: <Widget>[
              Text("Foo"),
              Text("Foo"),
              Text("Foo"),
              Text("Foo"),
              Text("Foo"),
            ],
          )
        ],
      ),
    );
  }
}
