import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BackgroundVideoWidget extends StatefulWidget {
  const BackgroundVideoWidget({super.key});

  @override
  State<BackgroundVideoWidget> createState() => _BackgroundVideoWidgetState();
}

class _BackgroundVideoWidgetState extends State<BackgroundVideoWidget> {
  late final VideoPlayerController controller;
  @override
  void initState() {
    controller = VideoPlayerController.asset("assets/video.mp4")..initialize().then((_){
    controller.play();
    controller.setLooping(true);
    });
  super.initState(); 
  }
  @override
  Widget build(BuildContext context) {
    return VideoPlayer(controller);
  }
}