import 'package:flutter/material.dart';
import 'poi.dart';
import "registro.dart";


class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _nombre = TextEditingController();
  final _correo = TextEditingController();
  final _contrasena = TextEditingController();

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
            height: 20,
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const poi()));
                  }, child: const Text('Iniciar sesión',),
                ),

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