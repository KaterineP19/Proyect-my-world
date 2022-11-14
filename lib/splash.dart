import 'package:flutter/material.dart';
import "login.dart";

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);
  @override
  State<splash> createState() => _splashStatus();
}

class _splashStatus extends State<splash> {
  @override
  void initState() {
    _closeSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/imagenes/logo.png',
          scale: 2,
        ),
      ),
    );
  }

  Future<void> _closeSplash() async {
    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const login()));
    },
    );
  }
}