class PhotoAlbum {
  String? id;
  String? catName;
  String? name;
  String? mainImage;
  List<String>? matchImages;

  PhotoAlbum(
      {this.id, this.catName, this.name, this.mainImage, this.matchImages});

  PhotoAlbum.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    catName = json["cat_name"];
    name = json["name"];
    mainImage = json["main_image"];
    matchImages = json["match_images"] == null
        ? null
        : List<String>.from(json["match_images"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["cat_name"] = catName;
    data["name"] = name;
    data["main_image"] = mainImage;
    if (matchImages != null) {
      data["match_images"] = matchImages;
    }
    return data;
  }

  static List<PhotoAlbum> ofPhotoAlbum(List value) {
    return value.map((e) => PhotoAlbum.fromJson(e)).toList();
  }
}
