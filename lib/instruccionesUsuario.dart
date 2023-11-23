import 'package:farmacofy/almacen.dart';
import 'package:farmacofy/config_menu/menu_items.dart';
import 'package:farmacofy/anadirTratamiento/tratamientos2.dart';
import 'package:farmacofy/pantallaInicial.dart';
import 'package:flutter/material.dart';

class InstruccionesUsuario extends StatelessWidget {
  const InstruccionesUsuario({Key? key}) : super(key: key);

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
      body: Stack(
        children:[ Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(38.0),
              child: Text(
                'Instrucciones de uso',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: instruccionesUsoMenuItem.length,
                itemBuilder: (context, index) {
                  final instruccionIbuprofenoMenuItems = instruccionesUsoMenuItem[index];
                  return _CustomListTile(menuItem: instruccionIbuprofenoMenuItems);
                },
              ),
            ),
          ],
        ),
        Positioned(
          top: 50.0,
          right:20.0,
          child: Column(
            children: [
              IconButton(
                iconSize:  40.0,
                icon: Icon(Icons.add_a_photo_rounded),
                onPressed: (){

                },
                
              ),
              Text('Agregar foto')
            ],
          )
      
          )
        ]
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white, // Fondo del BottomNavigationBar
        ),
        child: BottomNavigationBar(
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
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final InstruccionesUsoMenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: menuItem.color),
      
      trailing: menuItem.title == 'Cantidad restante: ' ? Icon(Icons.arrow_forward_ios_rounded, color: colors.primary) : null,
      title:  Text(menuItem.title,style: TextStyle(

          fontSize: 17.0,),
      ),
      
      subtitle: Row(
        children: [
          Text(menuItem.subtitle),
          const SizedBox(
            width: 5,
          ),
          Text(
            menuItem.numPastillas,
            style: const TextStyle(color: Colors.red),
          ),
          
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, menuItem.link);
      },
      
    );
  }
}
