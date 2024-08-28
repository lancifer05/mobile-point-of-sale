import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(children: <Widget>[
          TextBox("Username", (val) {
            username = val;
          }),
          Container(
            padding: EdgeInsets.all(10),
            width: 500,
            child: TextFormField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(), labelText: "Password"),
            ),
          ),
          ElevatedButton(
            style: raisedButtonStyle,
            onPressed: () {
              context.go('/home');
            },
            child: Text('Log in'),
          ),
        ]),
      ]),
    ));
  }
}

Container TextBox(String label, onChange) {
  return Container(
      padding: EdgeInsets.all(10),
      width: 500,
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        onChanged: onChange,
      ));
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.black87, // Color for text
  backgroundColor: Colors.yellow, // Color for button background
  minimumSize: Size(88, 56),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
).copyWith(
  elevation: MaterialStateProperty.all<double>(1), // Set elevation here
);
