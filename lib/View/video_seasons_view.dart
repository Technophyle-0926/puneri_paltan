import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puneri_paltan/Model/seasons_model.dart';
import 'package:http/http.dart' as http;
import 'package:puneri_paltan/View/videos_view.dart';

class VideoSeasonsView extends StatefulWidget {
  const VideoSeasonsView({super.key});

  @override
  State<VideoSeasonsView> createState() => _VideoSeasonsViewState();
}

class _VideoSeasonsViewState extends State<VideoSeasonsView> {
  List<Seasons>? getseasons;
  void getSeasons() async {
    try {
      var response = await http.get(Uri.parse(
          "https://appy.trycatchtech.com/v3/puneri_paltan/season_list"));
      if (response.statusCode == 200) {
        setState(() {
          getseasons = Seasons.ofSeasons(jsonDecode(response.body));
        });
      }
    } catch (e) {
      stderr.printError(info: e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getSeasons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Videos by Seasons",
          style: GoogleFonts.belanosima(fontSize: 40),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: getseasons == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: getseasons!.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => VideosView(),
                        arguments: {
                          'id': getseasons![i].id ?? '',
                          'catName': getseasons![i].catName ?? '',
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffFEA55E),
                            Color(0xffF37F30),
                            Color(0xffF4AF23),
                          ],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          getseasons![i].catName ?? '',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.blackOpsOne(
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
