class Category {
  int id;
  String catName;
  String catImageURL;

  Category(this.id, this.catName, this.catImageURL);

  factory Category.fromJson(Map json){
    return Category(json['id'], json["name"], json["avatar"]);
  }
}