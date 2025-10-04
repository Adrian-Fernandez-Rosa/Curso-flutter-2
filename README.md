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


# Temas de módulo 2

## ✍️ TextEditingControllers en Flutter

Un **TextEditingController** es el puente entre la **UI** y el **código** para manejar entradas de texto en `TextField` o `TextFormField`.

### 🔹 ¿Qué permite hacer?
- 📖 **Leer** el texto actual del campo con `.text`.  
- ✏️ **Modificar** el texto desde el código (`controller.text = "nuevo texto";`).  
- 🔔 **Escuchar cambios** en tiempo real mediante `addListener`.  

👉 Es la forma más común y eficiente de interactuar con inputs de texto en Flutter.


## 🎯 FocusNode  

El **FocusNode** en Flutter sirve para manejar el foco de un widget, normalmente en campos de texto (`TextField`).  

---

### 🔹 Qué hace
- 👀 Saber si un `TextField` tiene el foco (activo para escribir).  
- 👉 Pedir foco en un campo desde el código.  
- 🔄 Mover el foco entre diferentes campos.  
- 🎧 Escuchar cuando el foco entra o sale del widget.  

---

📌 **FocusNode** es útil cuando querés controlar el teclado y el cursor **programáticamente**, en lugar de depender solo de los taps del usuario.

ThemeData

## 🎨 ThemeData en Flutter

El **ThemeData** es la clase que define el **tema visual global de tu app**.  
Sirve para mantener una apariencia **consistente** sin repetir estilos en cada widget.

---

### 🔹 ¿Qué permite hacer?
- 🎨 Definir **colores globales** (primario, secundario, fondo, etc.).  
- ✍️ Configurar la **tipografía** (fuentes, tamaños de texto).  
- 🧩 Establecer estilos para **AppBar, Buttons, FloatingActionButton, Iconos** y más.  
- 📌 Asegurar una experiencia visual coherente en toda la app.  

---

### 🔹 Ejemplo
```dart
MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 18, color: Colors.black),
    ),
  ),
  home: const MyHomePage(),
);
```

ThemeData es el diseñador global de tu app, y todos los widgets heredan sus estilos automáticamente.

Ademas se usara:

## 🧩 Widgets adicionales usados en Flutter

Además se usará:  

- **Container** → Un widget flexible que permite agrupar y dar estilo (color, bordes, márgenes) a otros widgets.  
- **SizedBox** → Se utiliza para dar un tamaño fijo o agregar espacio entre widgets.  
- **ListView** → Un contenedor que permite mostrar listas desplazables de widgets.  
- **Custom Widgets** → Widgets creados por el desarrollador para reutilizar estructuras personalizadas de UI.  
- **Expanded** → Expande un widget hijo para ocupar el espacio disponible dentro de un `Row` o `Column`.  
- **Padding** → Añade espacio interno alrededor de un widget para separar contenido.  
- **Image (desde internet)** → Permite cargar y mostrar imágenes directamente desde una URL.  


