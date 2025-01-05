import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/videos_api_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../logger_service.dart';
import 'single_video_view.dart';

class VideosView extends StatefulWidget {
  const VideosView({super.key});

  @override
  State<VideosView> createState() => _VideosViewState();
}

class _VideosViewState extends State<VideosView> {
  Map data = Get.arguments;
  VideoAlbumController controller = Get.put(VideoAlbumController());

  @override
  void initState() {
    super.initState();
    controller.getVideoAlbum(data['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        title: Text(
          data['catName'].toString().toUpperCase(),
          style: GoogleFonts.exo(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffF4AF23),
              Color(0xffF37F30),
              Color(0xffFEA55E),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: GetBuilder<VideoAlbumController>(builder: (controller) {
          return controller.getvideos == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : controller.getvideos!.isEmpty
                  ? Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 30,
                          ),
                          Text(
                            "Oops! No data found.",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 40,
                          childAspectRatio: 1.3,
                        ),
                        itemCount: controller.getvideos!.length,
                        itemBuilder: (context, i) {
                          YoutubePlayerController videocontroller =
                              YoutubePlayerController(
                            initialVideoId: controller.getvideos![i].url ?? '',
                            flags: YoutubePlayerFlags(
                              autoPlay: false,
                              mute: true,
                              hideControls: true,
                            ),
                          );
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => SingleVideoView(),
                                  arguments: controller.getvideos![i]);
                            },
                            child: Column(
                              children: [
                                Card(
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      controller.getvideos![i].name ?? '',
                                      style: GoogleFonts.exo2(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: YoutubePlayer(
                                        controller: videocontroller,
                                        showVideoProgressIndicator: false,
                                        onReady: () {
                                          logger.i("Video is Ready");
                                        }),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
        }),
      ),
    );
  }
}
