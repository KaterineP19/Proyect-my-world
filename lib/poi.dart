import 'package:flutter/material.dart';

class poi extends StatefulWidget {
  const poi({Key? key}) : super(key: key);
  @override
  State<poi> createState() => _poiState();
}

class _poiState extends State<poi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding:
            const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 5),
            child: Stack(
              children: [
                ClipRRect(
                  child: Image.asset(
                    height: 300,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    'assets/imagenes/1.jpg',
                  ),
                ),
                const Positioned(
                  bottom: 80,
                  left: 110,
                  child: Text('Florencia',
                      style: TextStyle(
                          fontFamily: 'NanumGothic',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0)),
    ),
                const Positioned(
                  bottom: 60,
                  left: 85,
                  child: Text(
                    'Caquetá, Colombia',
                    style: TextStyle(
                        fontFamily: 'NanumGothic',
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                const Positioned(
                  bottom: 18,
                  left: 0,
                  child: Text(
                    "1°36′51″ N 75°36′42″ W",
                    style: TextStyle(
                        fontFamily: 'NanumGothic',
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  left: 0,
                  child: Text(
                    "242 m.s.n.m.\t\t\t25°C",
                    style: TextStyle(
                        fontFamily: 'NanumGothic',
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 5, left: 8, right: 8, bottom: 5),
            child: SingleChildScrollView(
            child: Text(
                style: TextStyle(fontFamily: '  Arial',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
                "La puerta de Oro de la Amazonia Colombiana"),
          )),
          const Padding(
              padding: EdgeInsets.only(top: 5, left: 8, right: 8, bottom: 5),
              child: SingleChildScrollView(
                child: Text(
                    style: TextStyle(fontFamily: '  Arial',
                        fontSize: 20,
                        color: Colors.black),
                    textAlign: TextAlign.justify,
                        "Florencia es una ciudad joven ubicada en el piedemonte de la Cordillera Oriental. "
                        "El departamento de Caquetá está bañado por 16 ríos e innumerables quebradas, "
                        "de esos ríos, Florencia está rodeada por los ríos Hacha, Caraño, Orteguaza, San Pedro y Bodoquero; "
                        "y por algunas quebradas como la Sardina y la Perdiz; centro importante para la historia de la ciudad. "
                        "Este hecho hace de Florencia y sus alrededores un centro hidrográfico importante y "
                        "uno de los mejores destinos turísticos del sur del país. "),
              ))
        ],
      ),
    );
  }
}