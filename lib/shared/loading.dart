import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        body: Center(
          child: SpinKitFadingCube(
            color: Colors.brown,
            size: 32.0,
          ),
        ));
  }
}
