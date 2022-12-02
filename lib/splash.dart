import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_world/poi.dart';
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

  Future<void> _closeSplash() async {
    Future.delayed(const Duration(seconds: 3), () async {
      var usuarioLogueado = FirebaseAuth.instance.currentUser;
      if (usuarioLogueado == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Login()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const poi()));
      }
    },
    );
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
}