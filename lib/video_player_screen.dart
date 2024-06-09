import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  VideoPlayerScreen(this.videoUrl);
  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '',
      flags: YoutubePlayerFlags(
        autoPlay: true, // Set this to true for auto-play
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        appBar: AppBar(
          title: Text('Video Tutorial'),
        ),
        body: Center(
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.amber,
          ),
        ),
      );
    } catch (e) {
      print('Error initializing YouTube player: $e');
      // Return a placeholder or an error message widget
      return Container();
    }
  }
}
