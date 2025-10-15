import 'package:app_fica/presentation/widgets/shared/video/video_background.dart';
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
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
  
    super.initState();

    controller = VideoPlayerController.asset(widget.videoUrl)
    ..setVolume(0)
    ..setLooping(true);
   // ..play();

   _initializeVideoPlayerFuture = controller.initialize().then((_) {
    controller.play();
   });
  }

  @override
  void dispose() {
   
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
       builder: (context, snapshot) {
         if (snapshot.connectionState != ConnectionState.done){
         return const Center( child: CircularProgressIndicator( strokeWidth: 2,));
         }

         return GestureDetector(
          onTap: () {
            if ( controller.value.isPlaying) {
              controller.pause();
              return;
            }

            controller.play();
          },
           child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(controller),
           
                // Gradiente
                VideoBackground(
                  stops: const [0.82, 1.0],
                ),
                // Texto
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption)
                  )
           
              ],
            ), 
            ),
         );
       },
      );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;
  
  const _VideoCaption({super.key, required this.caption});

  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;


    return SizedBox(
      width: size.width * 0.6,
      child: Text(caption, maxLines: 2, style: titleStyle ,),
    );
  }
}