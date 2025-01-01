class VideoAlbum {
  String? id;
  String? catName;
  String? name;
  String? url;

  VideoAlbum({this.id, this.catName, this.name, this.url});

  VideoAlbum.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    catName = json["cat_name"];
    name = json["name"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["cat_name"] = catName;
    data["name"] = name;
    data["url"] = url;
    return data;
  }

  static List<VideoAlbum> ofVideoAlbum(List value) {
    return value.map((e) => VideoAlbum.fromJson(e)).toList();
  }
}
