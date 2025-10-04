# Curso-flutter-2
corso flutter2

Hola mundo en flutter
```dart

import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Center(child: Text('Hola mundo')),
    );
  }
}

```

en el siguiente código podemos ver que repetimos codigo para hacer botones, si bien el comportamiento y diseño cambia , las medidas son iguales, quizas podemos emplear un mismo código con parametros para no repetir tanto

```dart

import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;
  // String palabra = 'Clicks';

  @override
  Widget build(BuildContext context) {
    //  final palabra = clickCounter % 2 == 0 ? 'Clicks' : 'Click';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Functions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          )
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$clickCounter',
              style:
                  const TextStyle(fontSize: 160, fontWeight: FontWeight.w100)),
          Text('Click${clickCounter == 1 ? '' : 's'}',
              style: const TextStyle(fontSize: 25))
        ],
      )),

      
      floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              shape: const StadiumBorder(),
              onPressed: () {
                clickCounter++;

                // palabra = clickCounter % 2 == 0 ? 'Clicks' : "click";

                setState(() {});
              },
              child: const Icon(Icons.refresh_outlined),
            ),

          const SizedBox(height: 10,),
                 FloatingActionButton(
              shape: const StadiumBorder(),
              onPressed: () {
                clickCounter++;

                // palabra = clickCounter % 2 == 0 ? 'Clicks' : "click";

                setState(() {});
              },
              child: const Icon(Icons.plus_one),
            ),

             const SizedBox(height: 10,),
            FloatingActionButton(
              shape: const StadiumBorder(),

              onPressed: () {
                clickCounter--;

                // palabra = clickCounter % 2 == 0 ? 'Clicks' : "click";

                setState(() {});
              },
              child: const Icon(Icons.exposure_minus_1_outlined),
            ),
          ],
        ));
  }
}
```

un poco de código limpio entre tanto desastre

```dart


import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;
  // String palabra = 'Clicks';

  @override
  Widget build(BuildContext context) {
    //  final palabra = clickCounter % 2 == 0 ? 'Clicks' : 'Click';

    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Functions'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            )
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter',
                style: const TextStyle(
                    fontSize: 160, fontWeight: FontWeight.w100)),
            Text('Click${clickCounter == 1 ? '' : 's'}',
                style: const TextStyle(fontSize: 25))
          ],
        )),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.refresh_rounded,
              onPressed: () {
                clickCounter = 0;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              icon: Icons.exposure_minus_1_outlined,
              onPressed: () {
                if (clickCounter == 0) return;
                clickCounter--;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              icon: Icons.plus_one,
              onPressed: () {
                clickCounter++;
                setState(() {});
              },
            ),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
    //  shape: const StadiumBorder(),
      enableFeedback: true,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}

```