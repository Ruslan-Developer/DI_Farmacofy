import 'package:farmacofy/BBDD/bbdd.dart';
import 'package:farmacofy/BBDD/bbdd_medicamento_old.dart';
import 'package:farmacofy/pages/page_tratamiento.dart';
import 'package:flutter/material.dart';

class ListadoTratamientos extends StatefulWidget {
  const ListadoTratamientos({super.key});

  @override
  State<ListadoTratamientos> createState() => _ListadoTratamientosState();
}

class _ListadoTratamientosState extends State<ListadoTratamientos> {
  BaseDeDatos bdHelper = BaseDeDatos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tratamientos'),
        backgroundColor: const Color(0xFF02A724),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Acción para el botón de configuración
            },
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: Stack(
        children: [
          FutureBuilder<List<Map<String, dynamic>>>(
            future: BaseDeDatos.consultarTratamientosConMedicamentos(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Mientras espera la respuesta de la BD muestra un indicador de carga
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                if (snapshot.hasData) {
                  print('Número de registros: ${snapshot.data!.length}');
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        //Separacion entre las tarjetas
                        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                                'https://www.stylist.co.uk/images/app/uploads/2022/06/01105352/jennifer-aniston-crop-1654077521-1390x1390.jpg?w=256&h=256&fit=max&auto=format%2Ccompress'),
                          ),
                          title: Text(
                            snapshot.data![index]['condicionMedica'] ??
                                'Sin nombre del medicamento',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Dosis: ${snapshot.data![index]['dosis']}'),
                              Text(
                                  'Fecha de inicio: ${snapshot.data![index]['fechaInicio']}'),
                              Text(
                                  'Fecha de fin: ${snapshot.data![index]['fechaFin']}'),
                              Text(
                                  'Frecuencia: ${snapshot.data![index]['frecuencia']}'),
                              Text(
                                  'Via de administración: ${snapshot.data![index]['viaAdministracion']}'),
                              Text(
                                  'Medicamento: ${snapshot.data![index]['nombreMedicamento']}'), // Acordarse de poner: m.nombre as nombreMedicamento
                            ],
                          ),
                          onTap: () {
                            // Acción al pulsar sobre la tarjeta
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('No hay tratamientos'));
                }
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            //Cambiar a pantalla de Formulario medicamento
            // MaterialPageRoute(builder: (context) => const Tratamientos1()),
            MaterialPageRoute(builder: (context) => const PaginaTratamiento()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xFF02A724),
      ),
    );
  }
}
