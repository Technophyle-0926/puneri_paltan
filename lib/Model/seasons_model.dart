class Seasons {
  String? id;
  String? catName;

  Seasons({this.id, this.catName});

  Seasons.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    catName = json["cat_name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["cat_name"] = catName;
    return data;
  }

  static List<Seasons> ofSeasons(List value) {
    return value.map((e) => Seasons.fromJson(e)).toList();
  }
}
