import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class FullscrenPlayer extends StatefulWidget {

  final String videoUrl;
  final String caption;


  const FullscrenPlayer({
    super.key, 
    required this.videoUrl, 
    required this.caption
    });

  @override
  State<FullscrenPlayer> createState() => _FullscrenPlayerState();
}

class _FullscrenPlayerState extends State<FullscrenPlayer> {

  late VideoPlayerController controller;

  @override
  void initState() {
  
    super.initState();

    controller = VideoPlayerController.asset(widget.videoUrl)
    ..setVolume(0)
    ..setLooping(true)
    ..play();
  }

  @override
  void dispose() {
   
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
       builder: (context, snapshot) {
         
         return const Center( child: CircularProgressIndicator( strokeWidth: 2,));
       },
      );
  }
}