import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/seasons_api_controller.dart';
import '../View/photos_view.dart';

class PhotosSeasonsView extends StatefulWidget {
  const PhotosSeasonsView({super.key});

  @override
  State<PhotosSeasonsView> createState() => _SeasonsViewState();
}

class _SeasonsViewState extends State<PhotosSeasonsView> {
  SeasonsController controller = Get.put(SeasonsController());

  @override
  void initState() {
    super.initState();
    controller.getSeasons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Photos".toUpperCase(),
          style: GoogleFonts.exo(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber.shade800,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffF4AF23),
              Color(0xffF37F30),
              // Color(0xffFEA55E),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: GetBuilder<SeasonsController>(builder: (controller) {
          return controller.getseasons == null
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
                      childAspectRatio: 2,
                    ),
                    itemCount: controller.getseasons!.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            () => PhotosView(),
                            arguments: {
                              'id': controller.getseasons![i].id ?? '',
                              'catName':
                                  controller.getseasons![i].catName ?? '',
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              controller.getseasons![i].catName ?? '',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.bungeeSpice(
                                fontSize: 30,
                              ),
                            ),
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
