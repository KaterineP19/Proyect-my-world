import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_world/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../poi.dart';

class pois extends StatefulWidget {
  const pois({Key? key}) : super(key: key);
  @override
  State<pois> createState() => _poisState();
}

enum Menu {inicio, cerrarSesion}

class _poisState extends State<pois> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sitios Turisticos"),
        actions: [
          PopupMenuButton(
            onSelected: (Menu item){
              setState(() {
                if (item == Menu.cerrarSesion){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                } else {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => poi()));
                }
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry <Menu>>[
              const PopupMenuItem(
                value: Menu.inicio, child: Text("Inicio"),
              ),
              const PopupMenuItem(
                value: Menu.cerrarSesion, child: Text("Cerrar Sesión"),
              ),
            ],
          )],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}