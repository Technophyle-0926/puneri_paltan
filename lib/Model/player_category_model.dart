class PlayerCat {
  String? id;
  String? catName;

  PlayerCat({this.id, this.catName});

  PlayerCat.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    catName = json["cat_name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["cat_name"] = catName;
    return data;
  }

  static List<PlayerCat> ofPlayerCat(List value) {
    return value.map((e) => PlayerCat.fromJson(e)).toList();
  }
}
