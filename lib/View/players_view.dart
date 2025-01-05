import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../Controller/players_api_controller.dart';
import '../View/player_details_view.dart';

class PlayersView extends StatefulWidget {
  const PlayersView({super.key});

  @override
  State<PlayersView> createState() => _PlayersViewState();
}

class _PlayersViewState extends State<PlayersView> {
  PlayersController controller = Get.put(PlayersController());

  @override
  void initState() {
    super.initState();
    if (controller.getplayers!.isEmpty) {
      controller.getPlayers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Players".toUpperCase(),
          style: GoogleFonts.exo(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffF4AF23),
              Color(0xffF37F30),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: GetBuilder<PlayersController>(builder: (controller) {
          return controller.getplayers == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 2),
                    itemCount: controller.getplayers!.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => PlayerDetailsView(), arguments: {
                            'id': '${controller.getplayers![i].id}',
                            'name':
                                '${controller.getplayers![i].name?.split(' ').first}'
                          });
                        },
                        child: Card(
                          elevation: 10,
                          child: Row(
                            spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.network(
                                controller.getplayers![i].profileImage ?? '',
                                height: 200,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.grey.shade100,
                                      child: Image.asset(
                                          'assets/player_profile.png'),
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(
                                    child: Icon(Icons.error, color: Colors.red),
                                  );
                                },
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.getplayers![i].name
                                            ?.split(' ')
                                            .first ??
                                        '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    controller.getplayers![i].name
                                            ?.split(' ')
                                            .skip(1)
                                            .join() ??
                                        '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Position: \n${controller.getplayers![i].position ?? ''}',
                                    style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    controller.getplayers![i].jerseyNo == '0'
                                        ? "Jersey No: N/A"
                                        : "Jersey No: ${controller.getplayers![i].jerseyNo ?? ''}",
                                    style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Nationality: ${controller.getplayers![i].nationality}",
                                    style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              )
                            ],
                          ),
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
