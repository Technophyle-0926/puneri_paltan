import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../Controller/player_details_api_controller.dart';

class PlayerDetailsView extends StatefulWidget {
  const PlayerDetailsView({super.key});

  @override
  State<PlayerDetailsView> createState() => _PlayerDetailsViewState();
}

class _PlayerDetailsViewState extends State<PlayerDetailsView> {
  PlayerDetailsController controller = Get.put(PlayerDetailsController());
  Map playerInfo = Get.arguments;

  @override
  void initState() {
    super.initState();
    controller.getPlayerDetails(playerInfo['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.amber.shade800,
        title: Text(
          playerInfo['name'],
          style: GoogleFonts.exo2(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
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
        child: GetBuilder<PlayerDetailsController>(builder: (controller) {
          return controller.playerDetails == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          controller.playerDetails![0].fullImage ?? '',
                          height: MediaQuery.sizeOf(context).height / 2.3,
                          width: double.infinity,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Image.asset(
                                  'assets/player_full.png',
                                  height:
                                      MediaQuery.sizeOf(context).height / 2.3,
                                  width: double.infinity,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Icon(Icons.error, color: Colors.red),
                            );
                          },
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.amber.shade800,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "JERSY NO.",
                                        style: GoogleFonts.exo2(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    controller.playerDetails![0].jerseyNo ?? '',
                                    style: GoogleFonts.exo(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Divider(),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.amber.shade800,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "POSITION",
                                        style: GoogleFonts.exo2(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    controller.playerDetails![0].position ?? '',
                                    style: GoogleFonts.exo(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Divider(),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.amber.shade800,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "VITALS",
                                        style: GoogleFonts.exo2(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Name",
                                            style: GoogleFonts.exo(
                                              fontSize: 25,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            controller.playerDetails![0].name ??
                                                '',
                                            style: GoogleFonts.exo(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "D.O.B.",
                                            style: GoogleFonts.exo(
                                              fontSize: 25,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            controller.playerDetails![0]
                                                    .dateOfBirth ??
                                                '',
                                            style: GoogleFonts.exo(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Nationality",
                                            style: GoogleFonts.exo(
                                              fontSize: 25,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            controller.playerDetails![0]
                                                    .nationality ??
                                                '',
                                            style: GoogleFonts.exo(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Divider(),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    "STATISTICS",
                                    style: GoogleFonts.exo2(
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber.shade800,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 60),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.amber.shade800,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "OVERALL",
                                        style: GoogleFonts.exo2(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Matches Played",
                                            style: GoogleFonts.exo(
                                              fontSize: 23,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            controller.playerDetails![0]
                                                    .matchesPlayed ??
                                                '',
                                            style: GoogleFonts.exo(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Total Points Earned",
                                            style: GoogleFonts.exo(
                                              fontSize: 23,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            controller.playerDetails![0]
                                                    .totalPonintsEarned ??
                                                '',
                                            style: GoogleFonts.exo(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Most Points In a Match",
                                            style: GoogleFonts.exo(
                                              fontSize: 23,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            controller.playerDetails![0]
                                                    .mostPointsInAMatch ??
                                                '',
                                            style: GoogleFonts.exo(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Not Out Percentage",
                                            style: GoogleFonts.exo(
                                              fontSize: 23,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            controller.playerDetails![0]
                                                    .notOutPercentage ??
                                                '',
                                            style: GoogleFonts.exo(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 60),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.amber.shade800,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "RAID",
                                        style: GoogleFonts.exo2(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "No. of Super Raids",
                                            style: GoogleFonts.exo(
                                              fontSize: 23,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            controller.playerDetails![0]
                                                    .noOfSuperRaids ??
                                                '',
                                            style: GoogleFonts.exo(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Super 10S",
                                            style: GoogleFonts.exo(
                                              fontSize: 23,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            controller.playerDetails![0]
                                                    .super10S ??
                                                '',
                                            style: GoogleFonts.exo(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Avg. Raid Points",
                                            style: GoogleFonts.exo(
                                              fontSize: 23,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            controller.playerDetails![0]
                                                    .avgRaidPoints ??
                                                '',
                                            style: GoogleFonts.exo(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 60),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.amber.shade800,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "TACKLES",
                                        style: GoogleFonts.exo2(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "No. of Super Tackles",
                                            style: GoogleFonts.exo(
                                              fontSize: 23,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            controller.playerDetails![0]
                                                    .noOfSuperTackles ??
                                                '',
                                            style: GoogleFonts.exo(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Total Tackle Points",
                                            style: GoogleFonts.exo(
                                              fontSize: 23,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            controller.playerDetails![0]
                                                    .totalTaclePoints ??
                                                '',
                                            style: GoogleFonts.exo(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
