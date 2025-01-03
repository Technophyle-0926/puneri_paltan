import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:puneri_paltan/Model/video_album_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SingleVideoView extends StatefulWidget {
  const SingleVideoView({super.key});

  @override
  State<SingleVideoView> createState() => _SingleVideoViewState();
}

class _SingleVideoViewState extends State<SingleVideoView> {
  late YoutubePlayerController videocontroller;
  @override
  void initState() {
    videocontroller = YoutubePlayerController(
      initialVideoId: video.url ?? '',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        hideControls: false,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    // Reset orientation to portrait when leaving this screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    videocontroller.dispose();
    super.dispose();
  }

  VideoAlbum video = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: YoutubePlayer(
          controller: videocontroller,
          showVideoProgressIndicator: true,
          onReady: () {
            videocontroller.toggleFullScreenMode();
            videocontroller.play();
            videocontroller.unMute();
          },
          onEnded: (metaData) {
            Get.back();
          },
        ),
      ),
    );
  }
}
