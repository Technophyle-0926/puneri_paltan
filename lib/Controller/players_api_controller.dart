import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/players_by_cat_model.dart';
import '../logger_service.dart';

class PlayersController extends GetxController {
  final List<PlayersByCat> _getplayers = [];
  List<PlayersByCat>? get getplayers => _getplayers;
  void getPlayers() async {
    List<int> categoryId = [1, 2, 3];

    try {
      for (int id in categoryId) {
        var response = await http.get(Uri.parse(
            "https://appy.trycatchtech.com/v3/puneri_paltan/player_list?cat_id=$id"));
        if (response.statusCode == 200) {
          var players = PlayersByCat.ofPlayersByCat(jsonDecode(response.body));
          _getplayers.addAll(players);
        }
      }
      update();
    } catch (e) {
      logger.e("Error in Players Controller: $e");
    }
  }
}
