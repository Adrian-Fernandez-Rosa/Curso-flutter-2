import 'package:app_fica/domain/entities/video_post.dart';
import 'package:flutter/material.dart';




class DiscoverProvider extends ChangeNotifier{

bool initialLodaing = true; //cargando los primeros videos
List<VideoPost> videos = [];

Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    //final newVideos = List.generate(10, (index) => VideoPost(caption: 'Video $index', videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', likes: 100, view: 200));

    notifyListeners();


  }
}
