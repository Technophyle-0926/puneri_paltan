import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puneri_paltan/Model/photo_album_model.dart';
import 'package:http/http.dart' as http;
import 'package:puneri_paltan/View/photos_collection_view.dart';

class PhotosView extends StatefulWidget {
  const PhotosView({super.key});

  @override
  State<PhotosView> createState() => _PhotosViewState();
}

class _PhotosViewState extends State<PhotosView> {
  Map data = Get.arguments;
  List<PhotoAlbum>? getphotos;
  void getPhotoAlbum(catId) async {
    try {
      var response = await http.get(Uri.parse(
          "https://appy.trycatchtech.com/v3/puneri_paltan/gallary_list?cat_id=$catId"));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        setState(() {
          getphotos =
              jsonResponse is List && jsonResponse.contains("No data Found")
                  ? []
                  : PhotoAlbum.ofPhotoAlbum(jsonResponse);
        });
      }
    } catch (e) {
      stderr.printError(info: e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getPhotoAlbum(data['id']);
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
      body: getphotos == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : getphotos!.isEmpty
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
                  itemCount: getphotos!.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => PhotosCollectionView(),
                            arguments: getphotos![i].matchImages);
                      },
                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              getphotos![i].mainImage ?? '',
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            (loadingProgress
                                                    .expectedTotalBytes ??
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
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              getphotos![i].name ?? '',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
