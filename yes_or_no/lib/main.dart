import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_or_no/config/theme/app_theme.dart';
import 'package:yes_or_no/presentation/providers/chat_provider.dart';
import 'package:yes_or_no/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()) //generalmente va context en vez de _ pero como no se utiliza...
      ],
      child: MaterialApp(
        title: 'Yes No App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 1).theme(),
        home: const ChatScreen()
      ),
    );
  }
}