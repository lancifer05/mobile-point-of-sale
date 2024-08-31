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
            width: 400,
            child: TextFormField(
              decoration: const InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFF127681),
                        width: 2.0), // Yellow border color and width
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFF127681),
                        width: 2.0), // Yellow border color when focused
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFF127681),
                        width: 2.0), // Yellow border color when enabled
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(color:Color(0xFF127681))),
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

Container TextBox(String label, ValueChanged<String> onChange) {
  return Container(
    padding: EdgeInsets.all(10),
    width: 400,
    child: TextFormField(
      decoration: InputDecoration(
        labelStyle: const TextStyle(color:Color(0xFF127681)),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Color(0xFF127681),
              width: 2.0), // Yellow border color and width
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Color(0xFF127681),
              width: 2.0), // Yellow border color when focused
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Color(0xFF127681),
              width: 2.0), // Yellow border color when enabled
        ),
        labelText: label,
      ),
      onChanged: onChange,
    ),
  );
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: const Color(0xffF4F6FF), // Color for text
  backgroundColor: const Color(0xFF127681), // Color for button background
  minimumSize: Size(150, 56),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
).copyWith(
  elevation: MaterialStateProperty.all<double>(1), // Set elevation here
);
