import 'package:farmacofy/config_menu/menu_items.dart';
import 'package:farmacofy/pantallaInicial.dart';
import 'package:farmacofy/anadirTratamiento/tratamientos2.dart';
import 'package:flutter/material.dart';

class Tratamientos1 extends StatelessWidget {
  const Tratamientos1({Key? key}) : super(key: key);

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
                MaterialPageRoute(builder: (context) => const PantallaInicial()),
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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(38.0),
            child: Text(
              'Seleccione medicamento',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar medicamento...',
              ),
            ),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: ListView.builder(
              itemCount: appMenuItems.length,
              itemBuilder: (context, index) {
                final menuItem = appMenuItems[index];
                return _CustomListTile(menuItem1: menuItem);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Tratamientos2()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF02A724),
          ),
          child: const Text(
            'Siguiente',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem1,
  });

  final MenuItem menuItem1;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem1.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem1.title),
      subtitle: Row(
        children: [
          Text(menuItem1.subtitle),
          const SizedBox(
            width: 5,
          ),
          Text(
            "${menuItem1.price} €",
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, menuItem1.link);
      },
    );
  }
}
