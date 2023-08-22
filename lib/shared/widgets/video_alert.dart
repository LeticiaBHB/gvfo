import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoAlert extends StatefulWidget {
  final VideoPlayerController videoController;

  VideoAlert(this.videoController);

  @override
  _VideoAlertState createState() => _VideoAlertState();
}

class _VideoAlertState extends State<VideoAlert> {
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    widget.videoController.addListener(() {
      if (widget.videoController.value.isPlaying != _isPlaying) {
        setState(() {
          _isPlaying = widget.videoController.value.isPlaying;
        });
      }
    });
  }

  @override
  void dispose() {
    widget.videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      contentPadding: EdgeInsets.zero,
      content: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: widget.videoController.value.aspectRatio,
                child: VideoPlayer(widget.videoController),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () {
                      setState(() {
                        if (_isPlaying) {
                          widget.videoController.pause();
                        } else {
                          widget.videoController.play();
                        }
                      });
                    },
                    iconSize: 48.0,
                    color: Colors.amberAccent,
                  ),
                  IconButton(
                    icon: Icon(Icons.replay),
                    onPressed: () {
                      setState(() {
                        widget.videoController.seekTo(Duration.zero);
                        widget.videoController.play();
                      });
                    },
                    iconSize: 48.0,
                    color: Colors.amberAccent,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  widget.videoController.pause();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amberAccent,
                ),
                child: Text("Fechar", style: TextStyle(color: Colors.black45)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

