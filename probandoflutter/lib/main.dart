import 'package:flutter/material.dart';
import 'Drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Probando flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 194, 235, 49)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Hola mundo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
        toolbarHeight: 70,
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("Ingresar", style: TextStyle(fontSize: 40))
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child:SizedBox(
                        width: 300,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Ingrese su nombre",
                              icon: Icon(Icons.person)),
                        ),
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child:  SizedBox(
                          width: 300,
                          child: TextFormField(
                            decoration: const InputDecoration(
                                hintText: "Contraseña",
                                icon: Icon(Icons.password)),
                          ),
                        ), 
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}