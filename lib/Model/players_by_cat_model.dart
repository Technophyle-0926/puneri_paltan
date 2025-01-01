class PlayersByCat {
  String? id;
  String? catName;
  String? name;
  String? profileImage;
  String? fullImage;
  String? jerseyNo;
  String? position;
  String? dateOfBirth;
  String? nationality;

  PlayersByCat(
      {this.id,
      this.catName,
      this.name,
      this.profileImage,
      this.fullImage,
      this.jerseyNo,
      this.position,
      this.dateOfBirth,
      this.nationality});

  PlayersByCat.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    catName = json["cat_name"];
    name = json["name"];
    profileImage = json["profile_image"];
    fullImage = json["full_image"];
    jerseyNo = json["jersey_no"];
    position = json["position"];
    dateOfBirth = json["date_of_birth"];
    nationality = json["nationality"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["cat_name"] = catName;
    data["name"] = name;
    data["profile_image"] = profileImage;
    data["full_image"] = fullImage;
    data["jersey_no"] = jerseyNo;
    data["position"] = position;
    data["date_of_birth"] = dateOfBirth;
    data["nationality"] = nationality;
    return data;
  }

  static List<PlayersByCat> ofPlayersByCat(List value) {
    return value.map((e) => PlayersByCat.fromJson(e)).toList();
  }
}
