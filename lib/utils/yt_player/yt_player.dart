import 'package:flutter/material.dart';
import 'package:tentwenty_movie_app/config/color_constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YTPlayerScreen extends StatefulWidget {
  final String videoId;

  const YTPlayerScreen({super.key, required this.videoId});

  @override
  State<YTPlayerScreen> createState() => _YTPlayerScreenState();
}

class _YTPlayerScreenState extends State<YTPlayerScreen> {
  late final YoutubePlayerController _controller;
  String testURL = 'https://www.youtube.com/watch?v=0VH9WCFV6XQ';

  @override
  void initState() {
    super.initState();

    ///Links provided by the API are not working in iFrame implementation of Flutter webview.
    ///Hence an alternate Yt link was used instead.

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(testURL)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        // hideThumbnail: true,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: AppColors.ttLightPurple,
        // thumbnail: const Center(
        //   child: CircularProgressIndicator(
        //     color: AppColors.ttLightPurple,
        //   ),
        // ),
        onReady: () {
          debugPrint('Player is ready.');
          _controller.toggleFullScreenMode();
        },
        onEnded: (_) {
          _controller.toggleFullScreenMode();
          Navigator.of(context).pop();
        },
      ),
      builder: (context, player) {
        return player;
      },
    );
  }
}
