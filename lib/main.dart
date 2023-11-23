import 'package:farmacofy/almacen.dart';
import 'package:farmacofy/instruccionesUsuario.dart';
import 'package:farmacofy/pantallaInicial.dart';
import 'package:farmacofy/anadirTratamiento/tratamientos1.dart';
import 'package:flutter/material.dart';

import 'package:farmacofy/anadirTratamiento/tratamientos2.dart';
import 'package:farmacofy/anadirTratamiento/tratamientos3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PantallaInicial(),
      routes: {
        '/intruccionesUsuario': (context) => const InstruccionesUsuario(),
        '/tratamientos2': (context) => const Tratamientos2(),
        '/tratamientos3': (context) => const Tratamientos3(),
        '/compraFarmacia':(context) => const Almacen(),
      },
    );
  }
}

