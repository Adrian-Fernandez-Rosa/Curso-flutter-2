// Importaciones necesarias para la aplicación
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_or_no/config/theme/app_theme.dart';
import 'package:yes_or_no/presentation/providers/chat_provider.dart';
import 'package:yes_or_no/presentation/screens/chat/chat_screen.dart';

// Función principal que ejecuta la aplicación
void main() => runApp(const MyApp());

// Clase principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Devuelve un MultiProvider que envuelve varios proveedores de estado
    return MultiProvider(
      providers: [
        // Crea un proveedor de estado que notifica a los widgets cuando cambia el estado
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        // Establece el título de la aplicación
        title: 'Yes No App',
        // Oculta el banner de depuración
        debugShowCheckedModeBanner: false,
        // Establece el tema de la aplicación
        theme: AppTheme(selectedColor: 1).theme(),
        // Establece la pantalla de inicio de la aplicación
        home: const ChatScreen()
      ),
    );
  }
}