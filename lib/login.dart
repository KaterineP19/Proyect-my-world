import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_world/models/User.dart';
import 'package:my_world/repositorio/firebase_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'poi.dart';
import 'package:my_world/registro.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final firebase_api _firebase_api = firebase_api();
  final _correo = TextEditingController();
  final _contrasena = TextEditingController();

  User cargarUser = User.Empty();

  @override
  void initState(){
    //_getUser();
    super.initState();
  }

  _getUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = jsonDecode(prefs.getString("user")!);
    //cargarUser = User.fromJson(userMap);
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
  
  void _validarUser() async {
    if(_correo.text.isEmpty || _contrasena.text.isEmpty){
      _mostrarMsg(context, "Debe digitar el correo y la contraseña");
    } else{
      var resultado = await _firebase_api.loginUser(_correo.text, _contrasena.text);
      if (resultado == "invalid-email"){
        _mostrarMsg(context, "Correo electronico invalido");
      } else if (resultado == "wrong-password"){
        _mostrarMsg(context, "Correo o contraseña incorrecta");
      } else if (resultado == "network-request-failed") {
        _mostrarMsg(context, "Sin conexión a internet");
      } else if (resultado == "user-not-found"){
      _mostrarMsg(context, "Usuario no registrado");
      } else {
        _mostrarMsg(context, "Bienvenid@");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => poi()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
            CircleAvatar(
                radius: 50,
                child: Image.asset('assets/imagenes/logo.png')),

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
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                ),
              ),

            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 16)),
              onPressed: () {
                _validarUser();
                  }, child: const Text('Iniciar sesión',),),

              const SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const registro()));
                }, child: const Text('Registrarse',
                  style: TextStyle(color: Color(0xFF212121), fontSize: 15),),
              ),
            ]),
          ),
        ),
      );
    }
  }