import 'package:farmacofy/almacen.dart';
import 'package:farmacofy/config_menu/menu_items.dart';
import 'package:farmacofy/anadirTratamiento/tratamientos2.dart';
import 'package:farmacofy/instruccionesUsuario.dart';
import 'package:farmacofy/pantallaInicial.dart';
import 'package:flutter/material.dart';

class Almacen extends StatelessWidget {
  const Almacen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FarmacoFy'),
        backgroundColor: const Color(0xFF02A724),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Acción para el botón de configuración
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(38.0),
            child: Text(
              'Farmacias cercanas',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: ListView.builder(
              itemCount: farmaciasMenuItem.length,
              itemBuilder: (context, index) {
                final farmaciasMenuItems = farmaciasMenuItem[index];
                return _CustomListTile(menuItem: farmaciasMenuItems);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication_sharp),
            label: 'Tratamientos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pharmacy_rounded),
            label: 'Almacén',
          ),
        ],
        selectedItemColor: const Color(0xFF02A724),
        onTap: (index) {
          // Lógica para manejar la selección de ítem
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PantallaInicial()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InstruccionesUsuario()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Almacen()),
              );
              break;
          }
        },
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final FarmaciasMenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icono, color: menuItem.color),
      trailing: null,
      title: Center( // Añade este widget
      child: Text(menuItem.nombre, style: TextStyle(fontSize: 30.0)),
    ),
    subtitle: Column(
      children: [
        Text(menuItem.direccion, style: TextStyle(fontSize: 18.0)),
        const SizedBox(
          width: 5,
        ),
        Text(menuItem.telefono, style: TextStyle(fontSize: 16.0)),
        const SizedBox(
          width: 5,
        ),
        Text(menuItem.horario, style: TextStyle(fontSize: 14.0)),
      ],
    ),
  );
}
}
