import 'dart:math';

import 'package:flutter/material.dart';
import 'Drawer.dart';


class MyScrolling extends StatefulWidget{
  const MyScrolling({super.key});

  @override
  State<MyScrolling> createState() => _MyScrolling();
}

class _MyScrolling extends State<MyScrolling>{
  final _myLyst = List.generate(100, (index) => "Item ${index + 1}");

  void sumarTarjeta(){
    setState(() {
      _myLyst.add("Item ${_myLyst.length}");
    });
  }

  void restarTarjeta(int index){
    setState(() {
      _myLyst.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 44, 44, 44),
          toolbarHeight: 70,
          title: const Text("Scrolling", style: TextStyle(
            color: Colors.white
          ),),
          centerTitle: true,
        ),
        drawer: const MyDrawer(),
        body: Scrollbar(
          thickness: 15,
          interactive: true,
          thumbVisibility: true,
          radius: const Radius.circular(20),
          child: ListView.builder(
            itemCount: _myLyst.length,
            itemBuilder: (BuildContext context, index) {
              return Dismissible(
              key: ValueKey(_myLyst[index]),
              onDismissed: (direction){
                showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: const Text("Aviso"),
                      content: const Text("¿Estas seguro?"),
                      actions: [
                        TextButton(
                          onPressed: (){
                            restarTarjeta(index);
                            Navigator.of(context).pop();
                          },
                          child: const Text("Eliminar")
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancelar") 
                        )
                      ],
                    );
                  }
                );
              },
              child:Card(
              margin: const EdgeInsets.all(5),
              elevation: 5,
              color: Colors.accents[Random().nextInt(Colors.accents.length)],
              child: Column(
                children: [
                  ListTile(
                    title: Text(_myLyst[index], style: const TextStyle(fontSize: 20), textAlign: TextAlign.center,),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.all(10),
                          elevation: 10,
                          color: Colors.accents[Random().nextInt(Colors.accents.length)],
                          child: const ListTile(
                            title: Text("Opción 1", style: TextStyle( fontSize: 20),),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.all(10),
                          elevation: 10,
                          color: Colors.accents[Random().nextInt(Colors.accents.length)],
                          child: const ListTile(
                            title: Text("Opción 2", style: TextStyle(fontSize: 20),),
                          ),
                        ) 
                      )
                    ],
                  )
                ],
              ),
            ),
            );
            }
          ),
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          sumarTarjeta();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

