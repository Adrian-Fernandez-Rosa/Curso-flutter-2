import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clickCounter = 0;
  // String palabra = 'Clicks';


  @override
  Widget build(BuildContext context) {
    //  final palabra = clickCounter % 2 == 0 ? 'Clicks' : 'Click';


    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Counter Screen')),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$clickCounter',
              style:
                  const TextStyle(fontSize: 160, fontWeight: FontWeight.w100)),
          Text('Click${ clickCounter == 1 ? '' : 's'}', style: const TextStyle(fontSize: 25))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          clickCounter++;

         // palabra = clickCounter % 2 == 0 ? 'Clicks' : "click";

          setState(() {});
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
