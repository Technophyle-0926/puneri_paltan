import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/video_album_model.dart';
import '../logger_service.dart';

class VideoAlbumController extends GetxController {
  List<VideoAlbum>? _getvideos;
  List<VideoAlbum>? get getvideos => _getvideos;
  void getVideoAlbum(catId) async {
    try {
      var response = await http.get(Uri.parse(
          "https://appy.trycatchtech.com/v3/puneri_paltan/puneri_tv_list?cat_id=$catId"));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        _getvideos = body is List && body.contains("No data Found")
            ? []
            : VideoAlbum.ofVideoAlbum(body);
        update();
      }
    } catch (e) {
      logger.e("Error in VideoAlbum Controller: $e");
    }
  }
}
