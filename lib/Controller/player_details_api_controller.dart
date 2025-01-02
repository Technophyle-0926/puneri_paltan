import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/player_details_model.dart';
import '../logger_service.dart';

class PlayerDetailsController extends GetxController {
  List<PlayerDetails>? _playerDetails;
  List<PlayerDetails>? get playerDetails => _playerDetails;
  void getPlayerDetails(String id) async {
    try {
      var response = await http.get(Uri.parse(
          'https://appy.trycatchtech.com/v3/puneri_paltan/single_player?id=$id'));
      if (response.statusCode == 200) {
        _playerDetails =
            PlayerDetails.ofPlayersDetails(jsonDecode(response.body));
        update();
      }
    } catch (e) {
      logger.e("Error in PlayerDetails Controller: $e");
    }
  }
}
