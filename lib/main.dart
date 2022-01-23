import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // contador de likes y dislikes

  bool _correo = false; //  Indica si el boton
  bool _llamada = false; //  ha sido seleccionado
  bool _ruta = false; //  cuando se le presiona

  void _incrementCounter() {
    //funcion llamada para incrementar
    setState(
      //el contador
      () {
        _counter++;
      },
    );
  }

  void _decrementCounter() {
    //funcion llamada para decrementar
    setState(
      //el contador
      () {
        _counter--;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // cuerpo principal de la pantalla
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('lib/assets/images/iteso.jpg'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'El ITESO, Universidad Jesuita de Fuadalajara',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'San Pedro Tlaquepaque, Jal',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: _decrementCounter, //llamada a funcion
                  icon: const Icon(Icons.thumb_down), //icono
                ),
                IconButton(
                  onPressed: _incrementCounter,
                  icon: const Icon(Icons.thumb_up),
                ),
                Text('$_counter')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.mail),
                      color: _correo ? Colors.blue : Colors.black,
                      onPressed: () {
                        setState(() => _correo = !_correo);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Correo'),
                            duration: Duration(milliseconds: 300),
                          ),
                        );
                      },
                    ),
                    const Text('Correo'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add_ic_call_outlined),
                      color: _llamada ? Colors.blue : Colors.black,
                      onPressed: () {
                        setState(() => _llamada = !_llamada);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Llamada'),
                            duration: Duration(milliseconds: 300),
                          ),
                        );
                      },
                    ),
                    const Text('Llamada'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_sharp),
                      color: _ruta ? Colors.blue : Colors.black,
                      onPressed: () {
                        setState(() => _ruta = !_ruta);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Ruta'),
                            duration: Duration(milliseconds: 300),
                          ),
                        );
                      },
                    ),
                    const Text('Ruta'),
                  ],
                ),
              ],
            ),
            const Text(
                'El ITESO, Universidad Jesuita de Guadalajara es una universidad privada ubicada en la zona metropolitana de Guadalajara, Jalisco, Mexico, fundada en el ano 1957. La institucion forma parte del Sistema Universitario Jesuita que integra a ocho universidades en Mexico. Fundada en el ano 1957 por el ingeniero Jose Fernandez del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuacion se presenta la historia de la institucion en periodos de decadas'),
          ],
        ),
      ),
    );
  }
}
