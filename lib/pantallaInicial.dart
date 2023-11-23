import 'package:farmacofy/almacen.dart';
import 'package:farmacofy/anadirTratamiento/tratamientos1.dart';
import 'package:farmacofy/config_menu/menu_items.dart';
import 'package:farmacofy/anadirTratamiento/tratamientos2.dart';
import 'package:farmacofy/instruccionesUsuario.dart';
import 'package:flutter/material.dart';

class PantallaInicial extends StatelessWidget {
  const PantallaInicial({Key? key}) : super(key: key);

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
            padding: EdgeInsets.all(40.0),
            child: Text(
              'Recordatorio de medicamentos',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Row(
              children: [
                const SizedBox(
                  height: 50,
                ),
                //Posible imagen a añadir
                // Container(
                //   margin: const EdgeInsets.only(left: 140.0),
                //   child: const Image(
                //     image: NetworkImage(
                //         "https://i.pinimg.com/originals/d0/56/ab/d056ab76ccee4a9adc1625923ec992ae.png"),
                //     width: 50,
                //     height: 50,
                //   ),
                // )
              ],
            ),
          ),
          const SizedBox(height: 0),
          Expanded(
            child: ListView.builder(
              itemCount: tratamientoMenuItems.length,
              itemBuilder: (context, index) {
                final tratamientoMenuItem = tratamientoMenuItems[index];
                return _CustomListTile(menuItem: tratamientoMenuItem);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Tratamientos1()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xFF02A724),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Información',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pharmacy_rounded),
            label: 'Farmacias',
          ),
        ],
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

  final TratamientoMenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title,
      style: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold
      ),
      ),
      subtitle: Row(
        children: [
          Text(
            "${menuItem.numPastillas}",
            style: const TextStyle(color: Color.fromARGB(255, 12, 100, 40),
            fontSize: 20.0,
            ),
          ),
          Text(
            " - ${menuItem.hora}",
            style: const TextStyle(color: Color.fromARGB(255, 12, 100, 40),
            fontSize: 20.0,
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, menuItem.link);
      },
    );
  }
}
