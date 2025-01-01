import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:puneri_paltan/Model/players_by_cat_model.dart';
// import 'package:puneri_paltan_2/View/allrounder_player_view.dart';
// import 'package:puneri_paltan_2/View/defenders_players_view.dart';
// import 'package:puneri_paltan_2/View/raiders_players_view.dart';
import 'package:http/http.dart' as http;
import 'package:puneri_paltan/View/player_details_view.dart';

class PlayersView extends StatefulWidget {
  const PlayersView({super.key});

  @override
  State<PlayersView> createState() => _PlayersViewState();
}

class _PlayersViewState extends State<PlayersView> {
  List<PlayersByCat>? getplayers = [];
  void getPlayers() async {
    List<int> categoryId = [1, 2, 3];

    try {
      for (int id in categoryId) {
        var response = await http.get(Uri.parse(
            "https://appy.trycatchtech.com/v3/puneri_paltan/player_list?cat_id=$id"));
        if (response.statusCode == 200) {
          var players = PlayersByCat.ofPlayersByCat(jsonDecode(response.body));
          getplayers!.addAll(players);
        }
      }
      setState(() {});
    } catch (e) {
      stderr.printError(info: e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Squad",
          style: GoogleFonts.belanosima(fontSize: 40),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: getplayers == null
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
                itemCount: getplayers!.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => PlayerDetailsView(), arguments: {
                        'id': '${getplayers![i].id}',
                        'name': '${getplayers![i].name}'
                      });
                    },
                    child: Card(
                      elevation: 10,
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                            getplayers![i].profileImage ?? '',
                            height: 200,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          (loadingProgress.expectedTotalBytes ??
                                              1)
                                      : null,
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
                              // Text(
                              //   getplayers![i].name ?? '',
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.bold,
                              //     fontSize: 20,
                              //   ),
                              //   textAlign: TextAlign.center,
                              // ),
                              Text(
                                getplayers![i].name?.split(' ').first ??
                                    '', // Display first name
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                getplayers![i]
                                        .name
                                        ?.split(' ')
                                        .skip(1)
                                        .join() ??
                                    '', // Display surname
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
                                'Position: \n${getplayers![i].position ?? ''}',
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
                                getplayers![i].jerseyNo == '0'
                                    ? "Jersey No: N/A"
                                    : "Jersey No: ${getplayers![i].jerseyNo ?? ''}",
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
                                "Nationality: ${getplayers![i].nationality}",
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
            ),
    );
  }
}
