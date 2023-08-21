import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoAlert extends StatelessWidget {
  final VideoPlayerController videoController;

  VideoAlert(this.videoController);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 8 / 9,
              child: VideoPlayer(videoController),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                videoController.pause();
              },
              child: Text("Fechar"),
            ),
          ],
        ),
      ),
    );
  }
}
