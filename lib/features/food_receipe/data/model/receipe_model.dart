class ReceipeModel {
  List<Recipes> recipes = [];

  ReceipeModel.fromJson(Map<String, dynamic> json) {
    for (int i = 0; i < json["recipes"].length; i++) {
      recipes.add(Recipes.fromJson(json["recipes"][i]));
    }
  }
}

class Recipes {
  bool? vegetarian;
  String? sourceName;
  double? pricePerServing;
  int? id;
  String? title;
  int? minutes;
  String? image;

  Recipes.fromJson(Map<String, dynamic> json) {
    vegetarian = json["vegetarian"];
    sourceName = json["sourceName"];
    pricePerServing = json["pricePerServing"];
    id = json["id"];
    title = json["title"];
    minutes = json["readyInMinutes"];
    image = json["image"];
  }
}
