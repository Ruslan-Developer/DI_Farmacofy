import 'package:flutter/material.dart';

class MenuItem{
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;
  final double price;
  final int stock;
  final String manufacturer;

  const MenuItem( {
    required this.title, 
    required this.subtitle, 
    required this.link, 
    required this.icon,
    required this.price, 
    required this.stock, 
    required this.manufacturer
    });
}

const appMenuItems = <MenuItem>[

    MenuItem( //Se crea una lista de objetos de tipo MenuItem que sirve para crear el menu de la app
    title: 'Ibuprofeno', 
    subtitle: 'Ibucalm 50mg/g - Gel',
    price: 10.99,  // Agregando el precio
    stock: 100,    // Agregando la cantidad en stock
    manufacturer: 'Bayern',  // Agregando el fabricante
    link: '/tratamientos2', 
    icon: Icons.local_pharmacy,
    
    ),

    MenuItem(
    title: 'Paracetamol', 
    subtitle: '500mg', 
    price: 15.99,  // Agregando el precio
    stock: 50,    // Agregando la cantidad en stock
    manufacturer: 'Pfizer',  // Agregando el fabricante
    link: '/tratamientos2', 
    icon: Icons.medication
    ),

    MenuItem(
    title: 'Omeprazol cinfa', 
    subtitle: '40mg', 
    price: 9.99,  // Agregando el precio
    stock: 28,    // Agregando la cantidad en stock
    manufacturer: 'Cinfa',  // Agregando el fabricante
    link: '/tratamientos2', 
    icon: Icons.medication
    ),

    MenuItem(
    title: 'Sulpirida', 
    subtitle: '50mg', 
    price: 23.50,  // Agregando el precio
    stock: 30,    // Agregando la cantidad en stock
    manufacturer: 'KernPharma',  // Agregando el fabricante
    link: '/tratamientos2', 
    icon: Icons.medication
    ),

    
    MenuItem(
    title: 'Trankimazin', 
    subtitle: '0.50mg', 
    price: 30.45,  // Agregando el precio
    stock: 30,    // Agregando la cantidad en stock
    manufacturer: 'Viatris',  // Agregando el fabricante
    link: '/tratamientos2', 
    icon: Icons.medication
    ),

MenuItem(
    title: 'Feliben', 
    subtitle: '0.35mg', 
    price: 69.99,  // Agregando el precio
    stock: 10,    // Agregando la cantidad en stock
    manufacturer: 'Gebro Pharma',  // Agregando el fabricante
    link: '/tratamientos2', 
    icon: Icons.medication
    ),

    MenuItem(
    title: 'Arcoxia', 
    subtitle: '60mg', 
    price: 15.99,  // Agregando el precio
    stock: 28,    // Agregando la cantidad en stock
    manufacturer: 'Organon',  // Agregando el fabricante
    link: '/tratamientos2', 
    icon: Icons.medication
    ),

    MenuItem(
    title: 'Fosfocina', 
    subtitle: '500mg', 
    price: 19.99,  // Agregando el precio
    stock: 24,    // Agregando la cantidad en stock
    manufacturer: 'ERN',  // Agregando el fabricante
    link: '/tratamientos2', 
    icon: Icons.medication
    ),

];


class FrecuenciaMenuItem {
  final String title;
  final String link;
  final IconData icon;


  const FrecuenciaMenuItem({
    required this.title,
    required this.link,
    required this.icon,
  });
}

const frecuenciaAppMenuItems = <FrecuenciaMenuItem>[
  FrecuenciaMenuItem(
    title: '1 vez al dia',
    link: '/tratamientos3',
    icon: Icons.medication,
  ),
  FrecuenciaMenuItem(
    title: '2 veces al dia',
    link: '/tratamientos3',
    icon: Icons.medication,
  ),
  FrecuenciaMenuItem(
    title: '3 veces al dia',
    link: '/tratamientos3',
    icon: Icons.medication,
  ),
  FrecuenciaMenuItem(
    title: 'Prefiero no ser alertado de la toma',
    link: '/tratamientos3',
    icon: Icons.medication,
  ),
  FrecuenciaMenuItem(
    title: 'Personalizar alarma',
    link: '/tratamientos3',
    icon: Icons.medication,
  ),
];



class TratamientoMenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;
  final String numPastillas;
  final int stock;
  final String hora;

  const TratamientoMenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
    required this.numPastillas,
    required this.stock,
    required this.hora,
  });
}

const tratamientoMenuItems = <TratamientoMenuItem>[
  TratamientoMenuItem(
    title: 'Ibuprofeno',
    subtitle: 'Ibucalm 50mg/g - Gel',
    numPastillas: '1 pastilla',
    stock: 100,
    hora: '08:00H',
    link: '/intruccionesUsuario',
    icon: Icons.local_pharmacy,
  ),
  TratamientoMenuItem(
    title: 'Paracetamol',
    subtitle: '500mg',
    numPastillas: '2 pastillas',
    stock: 50,
    hora: '08:00H',
    link: '/intruccionesUsuario',
    icon: Icons.medication,
  ),
  TratamientoMenuItem(
    title: 'Omeprazol cinfa',
    subtitle: '40mg',
    numPastillas: '2 pastillas',
    stock: 28,
    hora: '14:00H',
    link: '/intruccionesUsuario',
    icon: Icons.medication,
  ),
  TratamientoMenuItem(
    title: 'Sulpirida',
    subtitle: '50mg',
    numPastillas: '3 pastillas',
    stock: 30,
    hora: '21:00H',
    link: '/intruccionesUsuario',
    icon: Icons.medication,
  ),
];

class InstruccionesUsoMenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;
  final String numPastillas;
  final int stock;
  final String hora;
  final Color? color;

  const InstruccionesUsoMenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
    required this.numPastillas,
    required this.stock,
    required this.hora,
    this.color,
  });
}
const instruccionesUsoMenuItem = <InstruccionesUsoMenuItem>[
  InstruccionesUsoMenuItem(
    title: 'Uso de ibuprofeno',
    subtitle: 'Leer atentamente el prospecto antes de su tomado',
    numPastillas: ' ',
    stock: 100,
    hora: '08:00H',
    color: Colors.green,
    link: '',
    icon: Icons.medical_information_outlined,
  ),
  InstruccionesUsoMenuItem(
    title: 'Se toma de tres a cuatro veces al día para la artritis, o cada 4 a 6 horas según sea necesario para aliviar el dolor',
    subtitle: 'Cantidad por paquete: ',
    numPastillas: '40 pastillas',
    stock: 100,
    hora: '08:00H',
    color: Colors.blue,
    link: '',
    icon: Icons.info_outline_rounded,
  ),
   InstruccionesUsoMenuItem(
    title: 'Las personas que toman medicamentos antiinflamatorios no esteroides (AINE) como ibuprofeno, pueden tener un riesgo más alto de sufrir un ataque cardíaco o un derrame cerebral',
    subtitle: '',
    numPastillas: ' ',
    stock: 100,
    hora: '08:00H',
    color: Colors.blue,
    link: '',
    icon: Icons.info_outline_rounded,
  ),
  InstruccionesUsoMenuItem(
    title: 'El ibuprofeno puede causar úlceras, sangrado o perforación (agujeros) en el estómago o el intestino delgado',
    subtitle: ' ',
    numPastillas: ' ',
    stock: 100,
    hora: '08:00H',
    color: Colors.red,
    link: '',
    icon: Icons.dangerous,
  ),
  InstruccionesUsoMenuItem(
    title: 'No use ibuprofeno si tuvo un ataque cardíaco recientemente, a menos que se lo indique su médic',
    subtitle: ' ',
    numPastillas: ' ',
    stock: 100,
    hora: '08:00H',
    link: '',
    color: Colors.red,
    icon: Icons.dangerous,
  ),
  InstruccionesUsoMenuItem(
    title: 'Si el dolor se mantiene durante más de 5 días, la fiebre más de 3 días o bien el dolor o la fiebre empeoran o aparecen otros síntomas, hay que interrumpir el tratamiento y consultar al médico',
    subtitle: ' ',
    numPastillas: ' ',
    stock: 40,
    hora: '08:00H',
    link: '',
    color: Colors.red,
    icon: Icons.notification_important_sharp,
  ),
  
  InstruccionesUsoMenuItem(
    title: 'Cantidad restante: ',
    subtitle: ' ',
    numPastillas: ' 1 pastilla',
    stock: 100,
    hora: '08:00H',
    color: Colors.cyan,
    link: '/compraFarmacia',
    icon: Icons.shopping_cart_outlined,
  ),
  InstruccionesUsoMenuItem(
    title: 'Uso de paracetamol',
    subtitle: 'Leer atentamente el prospecto antes de su tomado',
    numPastillas: ' ',
    stock: 100,
    hora: '08:00H',
    color: Colors.green,
    link: '',
    icon: Icons.medical_information_outlined,
  ),
  InstruccionesUsoMenuItem(
    title: 'Se toma de tres a cuatro veces al día, o cada 4 a 6 horas según sea necesario para aliviar el dolor',
    subtitle: 'Cantidad por paquete: ',
    numPastillas: '80 pastillas',
    stock: 100,
    hora: '08:00H',
    color: Colors.blue,
    link: '',
    icon: Icons.info_outline_rounded,
  ),
   InstruccionesUsoMenuItem(
    title: 'Informe a su médico si usted o alguien de su familia tiene o alguna vez tuvo una enfermedad cardíaca, un ataque cardíaco o un accidente cerebrovascular',
    subtitle: '',
    numPastillas: ' ',
    stock: 100,
    hora: '08:00H',
    color: Colors.blue,
    link: '',
    icon: Icons.info_outline_rounded,
  ),
  InstruccionesUsoMenuItem(
    title: 'No se automedique, consulte siempre a su médico ante cualquier síntoma, dolor o padecimiento',
    subtitle: ' ',
    numPastillas: ' ',
    stock: 100,
    hora: '08:00H',
    color: Colors.red,
    link: ' ',
    icon: Icons.dangerous,
  ),
  InstruccionesUsoMenuItem(
    title: 'Debe consultar a un médico si la fiebre persiste durante más de 3 días o el dolor dura más de 5 días',
    subtitle: ' ',
    numPastillas: ' ',
    stock: 100,
    hora: '08:00H',
    link: ' ',
    color: Colors.red,
    icon: Icons.dangerous,
  ),
  InstruccionesUsoMenuItem(
    title: 'Debe evitarse el uso simultáneo de este medicamento con otros medicamentos que contenga paracetamol, por ejemplo, medicamentos para la gripe y el catarro, ya que las dosis altas pueden dar lugar a daño en el hígado',
    subtitle: ' ',
    numPastillas: ' ',
    stock: 40,
    hora: '08:00H',
    link: ' ',
    color: Colors.red,
    icon: Icons.notification_important_sharp,
  ),
  
  InstruccionesUsoMenuItem(
    title: 'Cantidad restante: ',
    subtitle: ' ',
    numPastillas: ' 2 pastillas',
    stock: 100,
    hora: '08:00H',
    color: Colors.cyan,
    link: '/compraFarmacia',
    icon: Icons.shopping_cart_outlined,
  ),
  
];

class FarmaciasMenuItem {
  final String nombre;
  final String direccion;
  final IconData icono;
  final String telefono; 
  final String horario; 
  final Color? color;

  const FarmaciasMenuItem({
    required this.nombre,
    required this.direccion,
    required this.icono,
    required this.telefono, 
    required this.horario,
    this.color, 
  });
}

const farmaciasMenuItem = <FarmaciasMenuItem>[
  FarmaciasMenuItem(
    nombre: 'Farmacia Central',
    direccion: 'Calle Mayor, 10',
    icono: Icons.local_pharmacy_sharp,
    telefono: ' Tlf. 983-4567890', 
    horario: 'Horario: 08:00 - 22:00',
    color: Colors.blue, 
  ),
   FarmaciasMenuItem(
    nombre: 'Farmacia del Barrio',
    direccion: 'Avenida de la Constitución, 20',
    icono: Icons.local_pharmacy_rounded,
    telefono: ' Tlf. 983-7654321',
    horario: 'Horario: 09:00 - 21:00',
    color: Colors.blue,
  ),
  FarmaciasMenuItem(
    nombre: 'Farmacia 24 horas',
    direccion: 'Plaza del Sol, 15',
    icono: Icons.local_pharmacy_outlined,
    telefono: ' Tlf. 983-3581321',
    horario: 'Abierto 24 horas',
    color: Colors.green,
  ),
  FarmaciasMenuItem(
    nombre: 'Farmacia del Pueblo',
    direccion: 'Calle del Mercado, 5',
    icono: Icons.local_pharmacy,
    telefono: ' Tlf. 983-8033988',
    horario: ' Horario: 10:00 - 20:00',
    color: Colors.blue,
  ),

];



