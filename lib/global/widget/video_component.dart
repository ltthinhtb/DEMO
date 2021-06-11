import 'dart:io';

import 'package:bloc_example/global/widget/video_play.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerComponent extends StatefulWidget {
  final File file;

  const VideoPlayerComponent({Key? key, required this.file}) : super(key: key);

  @override
  _VideoPlayerComponentState createState() => _VideoPlayerComponentState();
}

class _VideoPlayerComponentState extends State<VideoPlayerComponent> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.file);

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    //_controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoPlayerPage(file: widget.file)));
      },
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: AspectRatio(
              aspectRatio: 1,
              child: Stack(
                children: [
                  VideoPlayer(_controller),
                  Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.play_arrow,
                        size: 32,
                      )),
                ],
              ))),
    );
  }
}
