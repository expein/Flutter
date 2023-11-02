import 'package:flutter/material.dart';
import 'package:probandoflutter/Scrolling.dart';
import 'package:probandoflutter/main.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawer();
}

class _MyDrawer extends State<MyDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListView(
          shrinkWrap: true,
        children: <Widget>[
          const SizedBox(
            height: 120.0,
            child: DrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 194, 235, 49)),
              child: Text(
                "Drawer",
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          ListTile(
            title: const Text('Opción 1'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()));
            },
          ),
          ListTile(
            title: const Text('Opción 2'),
            onTap: () {
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => const MyScrolling())  
              );
            },
          ),
        ],
      ),
        ],
      )
    );
  }
}
