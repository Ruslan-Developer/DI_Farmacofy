

import 'package:farmacofy/BBDD/bbdd.dart';
import 'package:farmacofy/BBDD/bbdd_medicamento_old.dart';
import 'package:farmacofy/models/medicamento.dart';
import 'package:farmacofy/models/tratamiento.dart';
import 'package:farmacofy/pages/page_listado_tratamientos.dart';
import 'package:farmacofy/pantallaInicial.dart';
import 'package:flutter/material.dart';

class PaginaTratamiento extends StatefulWidget {
  const PaginaTratamiento({super.key, });

  @override
  State<PaginaTratamiento> createState() => _PaginaTratamientoState();
}

class _PaginaTratamientoState extends State<PaginaTratamiento> {

  final _formKey = GlobalKey<FormState>();
  //Tratamiento tratamiento = Tratamiento();
  Medicamento medicamento = Medicamento();
  Tratamiento tratamiento = Tratamiento();
  BaseDeDatos bdHelper = BaseDeDatos();
  bool _habilitado = false;
  String? _opcionSeleccionada;



  @override
  Widget build(BuildContext context) {
    return  GestureDetector(

      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },

      child: Scaffold(
        appBar: AppBar(
          title: const Text('Agregar Tratamiento'),
          backgroundColor: const Color(0xFF02A724),
          // 
          flexibleSpace: Container( //Sirve para definir el color de la barra de estado
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  
                  Color(0xFF02A724),
                  Color.fromARGB(255, 18, 240, 63),
                  Color.fromARGB(255, 11, 134, 34),
                  
                ],
              ),
            ),
          ),

          ),

          //Cuerpo de la página de tratamiento con formulario a rellenar
          body: Form(
            key: _formKey, // Se usa para validar el formulario
            child: SingleChildScrollView(
              child: Column(
                //<Widget> es un tipo de dato que indica que la lista solo puede contener widgets
                children: <Widget> [

                  ListTile(
                    title: Text(
                      'Prescripción del tratamiento', 
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ), 
                     ),
                    ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Condición médica',
                        hintText: 'Introduce la condición médica',
                        icon: Icon(Icons.medical_services_rounded, color: Color.fromARGB(255, 224, 13, 13)),
                      ),
                      //Validación del campo
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, introduce la condición médica';
                        }
                        return null;
                      },
                      //Asignación del valor del campo al atributo condicionMedica del objeto medicamento
                      onSaved: (value) {
                        if(value != null)
                        {
                          tratamiento.condicionMedica = value;
                        }
                      },
                    ),
                  ),  
                  
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Dosis',
                            hintText: 'Introduce la dosis del medicamento en cada toma',
                            icon: Icon(Icons.medication_liquid_sharp),
                          ),
                          keyboardType: TextInputType.number,
                          //Validación del campo
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, introduce la dosis del medicamento';
                            }
                            return null;
                          },
                          //Asignación del valor del campo al atributo dosis del objeto medicamento
                          onSaved: (value) {
                            if(value != null)
                            {
                              tratamiento.dosis = int.parse(value);
                            }
                  
                          },
                        ),
                  ),
                                Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Frecuencia',
                                  hintText: 'Introduce la frecuencia del medicamento',
                                  icon: Icon(Icons.medication_liquid),
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: 6,
                                    child: Text('Cada 6 horas'),
                                  ),
                                  DropdownMenuItem(
                                    value: 8,
                                    child: Text('Cada 8 horas'),
                                  ),
                                  DropdownMenuItem(
                                    value: 12,
                                    child: Text('Cada 12 horas'),
                                  ),
                                  DropdownMenuItem(
                                    value: 24,
                                    child: Text('Cada 24 horas'),
                                  ),
                           
                          ],
                          onChanged: (value) {
                            tratamiento.frecuencia = value!; //Asignación del valor del campo al atributo frecuencia del objeto medicamento
                          },
                          validator: (value) {
                            // Controlar que es un valor válido y un numero

                            if(value == null || value == 0)
                            {
                              return 'Por favor, seleccione la frecuencia del medicamento';
                            }
                            return null;
                          },
                          onSaved: (value){
                            tratamiento.frecuencia = value!;
                           },
                          ),
                         ),
                        ],
                       ),
                      ),
                   Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Via de administración',
                                  hintText: 'Introduce la via de administración del medicamento',
                                  icon: Icon(Icons.medication_rounded, color: Color.fromARGB(255, 24, 183, 211)),
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: 'Oral',
                                    child: Text('Oral'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Intravenosa',
                                    child: Text('Intravenosa'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Intramuscular',
                                    child: Text('Intramuscular'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Subcutánea',
                                    child: Text('Subcutánea'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Tópica',
                                    child: Text('Tópica'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Oftálmica',
                                    child: Text('Oftálmica'),
                                  ),
                                  
                                  DropdownMenuItem(
                                    value: 'Ótica',
                                    child: Text('Ótica'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Nasal',
                                    child: Text('Nasal'),
                                  ),

                                  DropdownMenuItem(
                                    value: 'Rectal',
                                    child: Text('Rectal'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Otro',
                                    child: Text('Otro'),
                                  ),
                                ],
                                onChanged: (value) {
                                  if(value != null){
                                    tratamiento.viaAdministracion = value; //Asignación del valor del campo al atributo viaAdministracion del objeto medicamento
                                  }
                                },
                               
                                onSaved: (value){
                                 if(value != null){
                                    tratamiento.viaAdministracion = value;
                                  }
                                  else
                                  {
                                    tratamiento.viaAdministracion = 'Ninguno'; //Si no se selecciona nada se asigna el valor 'Otro'
                                  }
                                }
                              ),
                              )
                          ],
                        )
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Fecha de inicio',
                            hintText: 'Introduce la fecha de inicio del medicamento',
                            icon: Icon(Icons.calendar_today_rounded, color: Color.fromARGB(255, 163, 22, 156)),
                          ),
                          keyboardType: TextInputType.datetime,
                          //Validación del campo
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, introduce la fecha de inicio';
                            }
                            if(RegExp(r'^(\d{2})/(\d{2})/(\d{4})$').hasMatch(value)==false)
                            {
                              return 'El formato de la fecha es incorrecto';
                            }else
                            {
                              return null;
                            }
                                                      
                          },
                          //Asignación del valor del campo al atributo fechaInicio del objeto medicamento
                          onSaved: (value){
                            if(value != null)
                            {
                              tratamiento.fechaInicio = value;
                            }
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Fecha de fin',
                            hintText: 'Introduce la fecha de fin del medicamento',
                            icon: Icon(Icons.calendar_month_rounded, color: Color.fromARGB(255, 57, 101, 196)),
                          ),
                          keyboardType: TextInputType.datetime,
                          //Validación del campo
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, introduce la fecha de fin';
                            }
                            if(RegExp(r'^(\d{2})/(\d{2})/(\d{4})$').hasMatch(value)==false)
                            {
                              return 'El formato de la fecha es incorrecto';
                            }else
                            {
                              return null;
                            }
                          
                          },
                          //Asignación del valor del campo al atributo fechaFin del objeto medicamento
                          onSaved: (value){
                            if(value != null)
                            {
                              tratamiento.fechaFin = value;
                            }
                          },
                        ),
                      ),
                      Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Detalles del tratamiento',
                          hintText: 'Introduce notas sobre el tratamiento',
                          icon: Icon(Icons.note_add_rounded, color: Color.fromARGB(255, 9, 168, 44)),
                        ),
                        keyboardType: TextInputType.multiline,
                       //
                        //Validación del campo
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, introduce una descripción del tratamiento';
                          }
                          return null;
                        },
                        //Asignación del valor del campo al atributo descripción del objeto medicamento
                        onSaved: (value) {
                          if(value != null)
                          {
                            tratamiento.descripcion = value;
                          }
                        },

                      
                      ),

                    ),
                      SizedBox(height: 15),
                      Divider(
                        color: Colors.green,
                        thickness: 2,
                      ),
                                     
                     ListTile(
                        title: Text(
                          'Recordatorios del tratamiento',
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                              Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Recordatorio para tratamientos',
                                  hintText: '¿Desea recordatorio para el tratamiento?',
                                  icon: Icon(Icons.alarm, color: Color.fromARGB(255, 204, 184, 2)),
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: 1,
                                    child: Text('Sí'),
                                  ),
                                  DropdownMenuItem(
                                    value: 2,
                                    child: Text('No'),
                                  ),
                                ],
                                onChanged: (value) {
                                  if(value != null)
                                  {
                                    tratamiento.recordatorio = value; //Asignación del valor del campo al atributo recordatorio del objeto medicamento
                                  }
                                 // tratamiento.recordatorio = value!; //Asignación del valor del campo al atributo recordatorio del objeto medicamento
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Por favor, seleccione si el medicamento tiene recordatorio';
                                  }
                                  return null;
                                },
                                onSaved: (value){
                                   if(value != null){
                                    tratamiento.recordatorio = value;
                                   }else{
                                      tratamiento.recordatorio = 2;
                                   }
                                }
                              ),
                            ),
                          ],
                        ),
                      ),

                    SizedBox(height: 15),
                      Divider(
                        color: Colors.green,
                        thickness: 2,
                      ),
                                     
                     ListTile(
                        title: Text(
                          'Selección del medicamento',
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),

                      FutureBuilder<List<Map<String, dynamic>>>(
                        future: BaseDeDatos.consultarBD('Medicamento'), 
                        builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                          if(snapshot.hasData) {
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: DropdownButtonFormField<String>(
                                      decoration: const InputDecoration(
                                        labelText: 'Listado medicamentos',
                                        hintText: 'Seleccione un medicamento',
                                        icon: Icon(Icons.medication_rounded, color: Color.fromARGB(255, 226, 33, 33),),
                                      ),
                                      items: snapshot.data == null ? [

                                      // Mostrar agregar un nuevo medicamento aqui ?
                                                                                                                               

                                      ] : snapshot.data!.map((medicamento) {
                                        return DropdownMenuItem(
                                          value: medicamento['id'].toString(),
                                          child: Column(
                                            children: [
                                              //Otra alternativa para mostrar el nombre del medicamento
                                              //child: Text(medicamento['nombre']),
                                              Text('Medicina : ${medicamento['nombre']}'),
                                              
                                            ],
                                          )

                                        
                                          
                                        );

                                      }).toList(),
                                      onChanged: (String? value) {
                                        setState(() {
                                          if(value != null)
                                          tratamiento.idMedicamento = int.parse(value); //Asignación del valor del campo al atributo idMedicamento del objeto medicamento
                                        });
                                      },
                                      /**
                                       * !IMPORTANTE:
                                       * * Aqui es donde se debe de asignar el valor del medicamento seleccionado al atributo idMedicamento del objeto tratamiento
                                       * * Pendiente ver como lo hago para crear Tratamiento al mismo tiempo que medicamento y asignar el id del medicamento al tratamiento
                                       */
                                      // validator: (value) {
                                      //   if (value == null) {
                                      //     return 'Por favor, seleccione un medicamento';
                                      //   }
                                      //   return null;
                                      // },
                                      // onSaved: (value){
                                      //   if(value != null){
                                      //     tratamiento.idMedicamento = int.parse(value);
                                      //   }
                                        //tratamiento.idMedicamento = value!;
                                      // }
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          else {
                            Future.delayed(Duration(seconds: 10));
                            return const Center(
                              
                              child: CircularProgressIndicator(),
                            );
                          }
                        }
                        ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                              Expanded(
                                child:  DropdownButtonFormField<String>(
                         
                                 decoration: const InputDecoration(



                                labelText: 'Añadir un medicamento',
                                hintText: 'cree un medicamento',
                                icon: Icon(Icons.add_task_outlined, color: Colors.green,),
                                
                                                             

                              ), // Not necessary for Option 1
                                value: _opcionSeleccionada,
                                items: const [
                            
                                  DropdownMenuItem(
                                    value: 'Nuevo medicamento',
                                    child: Text('Agregar nuevo medicamento'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'No agregar medicamento',
                                    child: Text('Deshabilitar campos medicamento'),
                                  ),

                                ],
                                onChanged: (String? value) {
                                  setState(() {
                                    _opcionSeleccionada = value;
                                    _habilitado = value == 'Nuevo medicamento'; // Habilita los campos si se selecciona 'Agregar nuevo medicamento'
                                  });
                                },
                                
                            ),
                            
                              )
                            
                          ],
                          
                        ),
                        
                      ),

        
                      Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Nombre del medicamento',
                        hintText: 'Introduce el nombre del medicamento',
                        icon: Icon(Icons.medication_rounded),
                      ),
                      //Validación del campo si esta habilitado el campo de texto
                       
                       validator: (value) {
                        if (!_habilitado) {
                          return null;
                        }
                        if (value == null || value.isEmpty) {
                          return 'Por favor, introduce el nombre del medicamento';
                        }
                        return null;
                      },

                      //Asignación del valor del campo al atributo nombre del objeto medicamento
                      onSaved: (value) {
                        if(value != null && _habilitado == true){
                          medicamento.nombre = value;
                                                   
                        }
                         
                      },
                      
                      enabled: _habilitado,
                    ),
                  ),

                   Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Prospecto del medicamento',
                        hintText: 'Introduce el prospecto del medicamento',
                     
                        icon: Icon(Icons.description_rounded),
                      ),
                      maxLines: 3,
                      //Validación del campo
                      validator: (value) {
                        if (!_habilitado) {
                          return null;
                        }
                        if (value == null || value.isEmpty ) {
                          return 'Por favor, introduce un prospecto del medicamento';
                        }
                        return null;
                      },
                      //Asignación del valor del campo al atributo descripción del objeto medicamento
                                        
                      onSaved: (value) {
                        if(value != null && _habilitado == true){
                          medicamento.prospecto = value;
                        }
                       
                      },
                      enabled: _habilitado,
                    ),
                  ),
                  // Campo para indicar la fecha de caducidad del medicamento
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                        labelText: 'Fecha de caducidad',
                        hintText: 'Introduce la fecha de caducidad del medicamento',
                        icon: Icon(Icons.calendar_today_rounded),
                      ),
                      //Validación del campo
                      validator: (value) {
                        if (!_habilitado) {
                          return null;
                        }
                        if (value == null || value.isEmpty) {
                          return 'Por favor, introduce la fecha de caducidad del medicamento';
                        }
                        if(RegExp(r'^(\d{2})/(\d{2})/(\d{4})$').hasMatch(value)==false)
                       
                        {
                          return 'El formato de la fecha es incorrecto';
                        }
                        String fechaCaducidad = value;

                        try{
                          
                           medicamento.fechaCaducidad = fechaCaducidad; //Asignación del valor del campo al atributo fechaCaducidad del objeto medicamento
                        }
                        catch(e){
                          return 'La fecha introducida no es válida';
                        }
                        return null;
                      },
                      //Asignación del valor del campo al atributo fechaCaducidad del objeto medicamento
                      onSaved: (value){
                        if(value != null && _habilitado == true)
                        {
                          medicamento.fechaCaducidad = value;
                          
                        }
                      },
                      enabled: _habilitado,
                    ),
                    ),
                  
                    //Campo del tipo de envase del medicamento
                    if(_habilitado == true) // Mustra el campo si selecciona 'Agregar nuevo medicamento'
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        
                        children: [
                          Expanded(
                            
                            child: DropdownButtonFormField(
                              
                              
                              decoration: const InputDecoration(
                                                             
                                labelText: 'Tipo de envase',
                                hintText: 'Introduce el tipo de envase del medicamento',
                                icon: Icon(Icons.medication_liquid),
                                                             

                              ),
                               
                              items: const [
                                DropdownMenuItem(
                                  
                                  value: 'Caja',
                                  child: Text('Caja'),
                                ),
                                DropdownMenuItem(
                                  
                                  value: 'Bote',
                                  child: Text('Bote'),
                                ),
                                DropdownMenuItem(
                                  
                                  value: 'Tubo',
                                  child: Text('Tubo'),
                                ),
                                DropdownMenuItem(
                                  
                                  value: 'Sobre',
                                  child: Text('Sobre'),
                                ),
                                DropdownMenuItem(
                                  
                                  value: 'Ampolla',
                                  child: Text('Ampolla'),
                                ),
                                DropdownMenuItem(
                                  
                                  value: 'Frasco',
                                  child: Text('Frasco'),
                                ),
                                DropdownMenuItem(
                                  
                                  value: 'Pomada',
                                  child: Text('Pomada'),
                                ),

                                DropdownMenuItem(
                                  
                                  value: 'Jeringa',
                                  child: Text('Jeringa'),
                                ),
                                DropdownMenuItem(
                                  
                                  value: 'Spray',
                                  child: Text('Spray'),
                                ),
                                DropdownMenuItem(
                                  
                                  value: 'Otro',
                                  child: Text('Otro'),
                                ),
                                                              
                              ], 
                              onChanged: (value) { 
                               if(value != null)
                               {
                                  medicamento.tipoEnvase = value; //Asignación del valor del campo al atributo tipoEnvase del objeto medicamento
                               }
                              },   
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, introduce el tipo de envase del medicamento';
                                }
                                return null;
                              },
                              onSaved: (value){
                                if(value != null)
                                {
                                  medicamento.tipoEnvase = value;
                                }
                              },
                                                                
                            
                            ),
                            
                            
                          ),
                          
                        ],
                         
                      ),
                                          
                      ),
                      //Campo para indicar la cantidad del medicamento
                          Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Cantidad del envase',
                            hintText: 'Introduce la cantidad del envase',
                            icon: Icon(Icons.local_drink),
                          ),
                          keyboardType: TextInputType.number,
                          //Validación del campo cantidadEnvase
                                                   
                         validator: (value) {
                              if (!_habilitado) {
                                return null;
                              }
                              if ((value == null || value.isEmpty)) {
                                return 'Por favor, introduce la cantidad del envase';
                              }
                              //Controlar que sea un número entero positivo
                              if(RegExp(r'^[0-9]+$').hasMatch(value)==false)
                              {
                                return 'La cantidad debe ser un número';
                              }
                            
                            return null;
                          },
                          onSaved: (value) {
                            if(_habilitado){
                              if(value != null)
                              {
                                medicamento.cantidadEnvase = int.parse(value);
                                
                              }
                            }
                            
                          },
                          enabled: _habilitado,
                        ),
                        
                      ),

                   
                      SizedBox(height: 15),
                      Divider(
                        color: Colors.green,
                        thickness: 2,
                      ),
                      SizedBox(height: 10),
                  
                    
                    //Botón para añadir el medicamento
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0), // Ajusta el valor según tus necesidades
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ElevatedButton.icon(
                          
                          onPressed: () {
                           
                            //Validación del formulario
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save(); //Guarda los datos del formulario
                              //Añadir el medicamento a la base de datos solo si se ha seleccionado la opción de añadir un medicamento
                              // if(_habilitado == true)
                              // {
                                BaseDeDatos.insertarBD('Medicamento', medicamento.toMap());
                              // }
                        
                              //Añadir el tratamiento a la base de datos
                              BaseDeDatos.insertarBD('Tratamiento', tratamiento.toMap());
                    
                              //Mostrar mensaje de confirmación despues de 1 segundo
                              Future.delayed(const Duration(seconds: 1), () {
                                //Mostrar mensaje de confirmación
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Tratamiento añadido correctamente'),
                                  ),
                                );
                                //Volver a la pagina de inicio
                                //Navigator.pop(context);
                                Navigator.pushReplacement(
                                  context,
                                MaterialPageRoute(builder: (context) => const ListadoTratamientos() ),
                                );
                              });
                            }
                          },
                          icon: const Icon(Icons.addchart_rounded),
                          label: const Text('Tratamiento'),
                                                 
                          
                          style: ButtonStyle(
                          
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white)// Añade tu color aquí
                          ),
                        ),
                      ),

                    ),    

                ],
              ),
            )
            ),

        ),
              
        
    );
  }
}





