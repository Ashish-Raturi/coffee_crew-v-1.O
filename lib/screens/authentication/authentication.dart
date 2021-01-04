import 'package:coffee_crew/screens/authentication/register.dart';
import 'package:coffee_crew/screens/authentication/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticaion extends StatefulWidget {
  @override
  _AuthenticaionState createState() => _AuthenticaionState();
}

class _AuthenticaionState extends State<Authenticaion> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
