import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/photo_album_model.dart';
import '../logger_service.dart';

class PhotosAlbumController extends GetxController {
  List<PhotoAlbum>? _getphotos;
  List<PhotoAlbum>? get getphotos => _getphotos;
  void getPhotoAlbum(catId) async {
    try {
      var response = await http.get(Uri.parse(
          "https://appy.trycatchtech.com/v3/puneri_paltan/gallary_list?cat_id=$catId"));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        _getphotos =
            jsonResponse is List && jsonResponse.contains("No data Found")
                ? []
                : PhotoAlbum.ofPhotoAlbum(jsonResponse);
        update();
      }
    } catch (e) {
      logger.e("Error in PhotoAlbum Controller: $e");
    }
  }
}
