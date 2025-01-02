import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../logger_service.dart';
import '../Model/seasons_model.dart';

class SeasonsController extends GetxController {
  List<Seasons>? _getseasons;
  List<Seasons>? get getseasons => _getseasons;
  void getSeasons() async {
    try {
      var response = await http.get(Uri.parse(
          "https://appy.trycatchtech.com/v3/puneri_paltan/season_list"));
      if (response.statusCode == 200) {
        _getseasons = Seasons.ofSeasons(jsonDecode(response.body));
        update();
      }
    } catch (e) {
      logger.e("Error in Seasons Controller: $e");
    }
  }
}
