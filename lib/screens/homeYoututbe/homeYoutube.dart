import 'package:flutter/material.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

class YoutubeVideoWidget extends StatefulWidget {


  @override
  State<YoutubeVideoWidget> createState() => _YoutubeVideoWidgetState();
}

class _YoutubeVideoWidgetState extends State<YoutubeVideoWidget> {

   YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'Fa1ZqhwXnnw',
    params: YoutubePlayerParams(
      autoPlay: true,
      showVideoAnnotations: false,
      // startAt: Duration(seconds: 30),
      showControls: true,
      showFullscreenButton: true,
    ),
  );

   @override
  void dispose() {
    super.dispose();
    _controller.close();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: YoutubePlayerIFrame(
          controller: _controller,
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}
