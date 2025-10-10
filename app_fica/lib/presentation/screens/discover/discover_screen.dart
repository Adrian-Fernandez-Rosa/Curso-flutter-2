import 'package:app_fica/presentation/providers/discover_provider.dart';
import 'package:app_fica/presentation/widgets/shared/video_scrollable_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class DiscoverScreen extends StatelessWidget {
 
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final discoverProvider = context.watch<DiscoverProvider>();
    
    return Scaffold(
        body: discoverProvider.initialLodaing
        ? const Center(child: CircularProgressIndicator(strokeWidth: 14,))
        : VideoScrollableView(videos:  discoverProvider.videos,) 
        // dibuja un rectángulo gris con una “X” para que vos visualices “acá va algo después”.

    );
  }
}