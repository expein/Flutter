import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({Key? key}) : super(key: key);

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text("Counter functions",
          style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              onPressed: () {
                setState(() {
                  count = 0;
                });
              },
            ),
          ],
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$count", style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),),
              Text("click${count != 1?'s':''}", style: const TextStyle(fontSize: 25),)
            ],
          ),
        ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(icon: Icons.refresh_rounded, onPressed: () {
            setState(() {
              count = 0;
            });
          },),
          const SizedBox(height: 10,),
          CustomButton(icon: Icons.plus_one, onPressed: () {
            setState(() {
              count++;
            });
          },),
          const SizedBox( height: 10 ),
          CustomButton(icon: Icons.exposure_minus_1_outlined, onPressed: () {
            setState(() {
              if(count == 0) return;
              count--;
            });
          },)
        ]
      )
    );
  }
}

class CustomButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key, 
    required this.icon, 
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: true,
      child: Icon(icon),
      onPressed: onPressed,
    );
  }
}
