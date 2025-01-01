import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:puneri_paltan/Model/video_album_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosView extends StatefulWidget {
  const VideosView({super.key});

  @override
  State<VideosView> createState() => _VideosViewState();
}

class _VideosViewState extends State<VideosView> {
  Map data = Get.arguments;
  List<VideoAlbum>? getvidoes;
  void getVideoAlbum(catId) async {
    try {
      var response = await http.get(Uri.parse(
          "https://appy.trycatchtech.com/v3/puneri_paltan/puneri_tv_list?cat_id=$catId"));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        setState(() {
          getvidoes =
              jsonResponse is List && jsonResponse.contains("No data Found")
                  ? []
                  : VideoAlbum.ofVideoAlbum(jsonResponse);
        });
      }
    } catch (e) {
      stderr.printError(info: e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getVideoAlbum(data['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data['catName'].toString(),
          style: GoogleFonts.bungeeSpice(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: getvidoes == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : getvidoes!.isEmpty
              ? Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error, color: Colors.red),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Oops! No data found."),
                    ],
                  ),
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.3,
                  ),
                  itemCount: getvidoes!.length,
                  itemBuilder: (context, i) {
                    YoutubePlayerController videocontroller =
                        YoutubePlayerController(
                      initialVideoId: getvidoes![i].url ?? '',
                      flags: YoutubePlayerFlags(
                        autoPlay: false,
                        mute: true,
                        hideControls: true,
                        showLiveFullscreenButton: true,
                      ),
                    );
                    return Card(
                      child: Column(
                        children: [
                          Text(getvidoes![i].name ?? ''),
                          YoutubePlayer(
                            controller: videocontroller,
                            showVideoProgressIndicator: false,
                            onReady: () =>
                                stderr.printInfo(info: 'Video Ready'),
                          )
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
