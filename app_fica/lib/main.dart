import 'package:app_fica/config/theme/app_theme.dart';
import 'package:app_fica/presentation/providers/discover_provider.dart';
import 'package:app_fica/presentation/screens/discover/discover_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider()..loadNextPage())
        /*
        final provider = DiscoverProvider();
        provider.loadNextPage(); invoca el metodo antes de devolverlo
        return provider;
        es lo mismo a lo de arriba
        */

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        title: 'Fica App',
        home: const DiscoverScreen(),
      ),
    );
  }
}