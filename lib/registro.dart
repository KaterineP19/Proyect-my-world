import 'package:flutter/material.dart';
import 'package:my_world/login.dart';
import 'poi.dart';

class registro extends StatefulWidget {
  const registro({Key? key}) : super(key: key);

  @override
  State<registro> createState() => _registroState();
}

class _registroState extends State<registro> {
  final _nombre = TextEditingController();
  final _correo = TextEditingController();
  final _contrasena = TextEditingController();
  final _recontrasena = TextEditingController();
  String _data = '';

  void _onRegistrarButtonClicked() {
    setState(() {
        _data = 'Nombre: ${_nombre.text}\n'
            'Email: ${_correo.text}\n';
      });
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
                  height: 80,
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
                  obscureText: true,
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
                  obscureText: true,
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
                    onPressed: (){Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const poi()));
                    }, child: const Text("Registrarse")),

                const SizedBox(
                  height: 8,
                ),
                TextButton(
                  onPressed: () {Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => const login()));
                    }, child: const Text('Regresar',
                  style: TextStyle(color: Color(0xFF212121), fontSize: 15),),
                ),

                Text(
                  _data,
                  style: const TextStyle(
                    fontSize: 12, fontStyle: FontStyle.italic),
                  ),
              ],
            )),
      ),
      )
    );
  }
}