import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({ Key? key }) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  int count = 0;

  void sumarNum(){

    setState(() {
      count++;
    });
  }

    void restarNum(){

      setState(() {
        count--;
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text("Counter screen", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$count", style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),),
            Text("click${count != 1?'s':''}")
          ],
        ),
      ),
     floatingActionButton: Row(
       children: [
         FloatingActionButton(
           child: const Icon(Icons.plus_one),
           onPressed: () {
             sumarNum();
           },
          ),
          FloatingActionButton(
            child: const Icon(Icons.one_k_rounded),
            onPressed: () {
              restarNum();
            },
          ),
       ]
     )
    );
  }
}