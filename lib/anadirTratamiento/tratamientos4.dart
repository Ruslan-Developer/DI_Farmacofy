import 'package:farmacofy/pantallaInicial.dart';
import 'package:farmacofy/anadirTratamiento/tratamientos3.dart';
import 'package:flutter/material.dart';

class Tratamientos4 extends StatelessWidget {
  const Tratamientos4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FarmacoFy'),
        backgroundColor: const Color(0xFF02A724),
        centerTitle: true, // Alinea el título en el centro
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Tratamientos3()),
              );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Recordatorio compra de nuevas pastillas',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 90),
            // Primer conjunto de campos de texto y número
            _buildTextWithNumberInput('Total pastillas envase:'),
            const SizedBox(height: 60),
            // Segundo conjunto de campos de texto y número
            _buildTextWithNumberInput('Numero de pastillas por toma:'),
            const Spacer(), // Añadido para empujar el botón hacia abajo
            // Botón "Finalizar"
            ElevatedButton(
              onPressed: () {
                // Lógica cuando se presiona el botón "Finalizar"
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PantallaInicial()),
              );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF02A724), // Color del botón
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0), // Ajuste del espacio interno
                child: Text('Finalizar', style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Función para construir un conjunto de campos de texto y número
  Widget _buildTextWithNumberInput(String labelText) {
    return Row(
      children: [
        Expanded(
          child: Text(
            labelText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 20),
        const Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: '',
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Tratamientos4(),
    );
  }
}

