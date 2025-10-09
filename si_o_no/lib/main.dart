import 'package:flutter/material.dart';
import 'package:si_o_no/config/theme/temas.dart';
import 'package:si_o_no/presentation/providers/chat_provider.dart';
import 'package:provider/provider.dart';
import 'package:si_o_no/presentation/screens/chat/chat_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(

      // acá creamos el ChatProvider y lo dejamos disponible para toda la app
      create: (_) => ChatProvider(),

      child: MaterialApp(
        title: 'Si o no APP',
        debugShowCheckedModeBanner: false,
        theme: ColorTemas(seleccionarColor: 2).temas(),
        home: const ChatScreen(),
      ),
    );
  }

 
}
