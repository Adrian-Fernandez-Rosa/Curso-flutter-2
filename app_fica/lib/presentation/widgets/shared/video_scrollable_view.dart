import 'package:app_fica/domain/entities/video_post.dart';
import 'package:app_fica/presentation/widgets/shared/video/fullscren_player.dart';
import 'package:app_fica/presentation/widgets/shared/video_buttons.dart';
import 'package:flutter/material.dart';


class VideoScrollableView extends StatelessWidget {
  
  
  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key, 
    required this.videos
    });
  
  
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(), //efecto rebote para android
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
       
       final VideoPost videoPost = videos[index];
       
       return  Stack(
          children: [
            // Video Player + gradiente
          SizedBox.expand(
            child: FullscrenPlayer(
              caption: videoPost.caption,
              videoUrl: videoPost.videoUrl,
            )
            ),

            // Botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost)
              ),
          ],
       );
      },
    );
  }

}

