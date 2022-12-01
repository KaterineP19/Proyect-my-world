import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_world/login.dart';
import 'package:my_world/models/User.dart';
import 'package:my_world/repositorio/firebase_api.dart';
import "package:shared_preferences/shared_preferences.dart";

class registro extends StatefulWidget {
  const registro({Key? key}) : super(key: key);
  @override
  State<registro> createState() => _registroState();
}

class _registroState extends State<registro> {
  final firebase_api _firebase_api = firebase_api();
  final _nombre = TextEditingController();
  final _correo = TextEditingController();
  final _contrasena = TextEditingController();
  final _recontrasena = TextEditingController();


  void _onRegistrarButtonClicked() {
    setState(() {
      if (_contrasena.text == _recontrasena.text){
        var user = User("", _nombre.text, _correo.text, _contrasena.text);
        _registarUser(user);
      }else{_mostrarMsg(context, "Las contraseñas no coinciden");}
    });
  }
  void _mostrarMsg (BuildContext context, String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
        SnackBar(
          content: Text(msg),
          action: SnackBarAction(
            label: "Aceptar", onPressed: scaffold.hideCurrentSnackBar),
        ));
  }

  void _saveUser (User user) async {
    var resultado = await _firebase_api.createUser(user);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
  }

  void _registarUser(User user) async{
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setString("user", jsonEncode(user));
    var resultado = await _firebase_api.registrarUser(user.correo, user.contrasena);
    String msg ="";
    if (resultado == "invalid-email"){
      msg ="El correo electronico es invalido";
    } else if (resultado == "email-already-in-use"){
      msg = "Correo electronico en uso";
    } else if (resultado == "weak-password"){
      msg = "La contraseña debe tener 6 digitos";
    } else if (resultado == "network-request-failed"){
      msg == "Sin conexión a internet";
    } else {
      msg = " Registro exitoso";
      user.uid = resultado;
      _saveUser (user);
    }
    _mostrarMsg(context, msg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                CircleAvatar(
                  radius: 70,
                 child: Image.asset('assets/imagenes/logo.png')),

                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _nombre,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre de usuario',
                    ),
                ),

                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _correo,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Correo electronico',
                  ),
                ),

                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _contrasena,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                  ),
                ),

                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _recontrasena,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Repita la contraseña',
                  ),
                ),

                const SizedBox(
                  height: 17,
                ),
                ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16)
                    ),
                    onPressed: (){
                      _onRegistrarButtonClicked();
                    }, child: const Text("Registrarse")),

                const SizedBox(
                  height: 8,
                ),
                TextButton(
                  onPressed: () {Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                    }, child: const Text('Regresar',
                  style: TextStyle(color: Color(0xFF212121), fontSize: 15),),
                ),
              ],
            )),
      ),
      )
    );
  }
}