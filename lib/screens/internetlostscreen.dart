import 'package:flutter/material.dart';
class InternetLostScreen extends StatelessWidget {
  const InternetLostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/error.png"))
        ),
      ),
    );
  }
}
