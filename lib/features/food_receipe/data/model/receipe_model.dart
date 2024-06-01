class ReceipeModel {
  late List<Recipes> recipes = [];

  ReceipeModel({required this.recipes});

  ReceipeModel.fromJson(Map<String, dynamic> json) {
    for (int i = 0; i < json["recipes"].length; i++) {
      recipes.add(Recipes.fromJson(json["recipes"][i]));
    }
  }
}

class Recipes {
  late bool vegetarian;
  late String sourceName;
  late double pricePerServing;
  late int id;
  late String title;
  late int minutes;
  late String image;
  late String instructions;
  late String spoonacularSourceUrl;
  late List<ExtendedIngredients> extendedIngredients = [];
  late List<Steps> analyzedInstructions = [];

  Recipes({
    required this.analyzedInstructions,
    required this.extendedIngredients,
    required this.id,
    required this.image,
    required this.instructions,
    required this.minutes,
    required this.pricePerServing,
    required this.sourceName,
    required this.spoonacularSourceUrl,
    required this.title,
    required this.vegetarian,
  });

  Recipes.fromJson(Map<String, dynamic> json) {
    vegetarian = json["vegetarian"];
    sourceName = json["sourceName"];
    pricePerServing = json["pricePerServing"];
    id = json["id"];
    title = json["title"];
    minutes = json["readyInMinutes"];
    image = json["image"];
    instructions = json["instructions"];
    spoonacularSourceUrl = json["spoonacularSourceUrl"];

    for (int i = 0; i < json["extendedIngredients"].length; i++) {
      extendedIngredients
          .add(ExtendedIngredients.fromJson(json["extendedIngredients"][i]));
    }

    for (int i = 0; i < json["analyzedInstructions"][0]["steps"].length; i++) {
      analyzedInstructions
          .add(Steps.fromJson(json["analyzedInstructions"][0]["steps"][i]));
    }
  }
}

class ExtendedIngredients {
  late String original;
  ExtendedIngredients({required this.original});

  ExtendedIngredients.fromJson(Map<String, dynamic> json) {
    original = json["original"];
  }
}

class Steps {
  late String steps;
  Steps({required this.steps});

  Steps.fromJson(Map<String, dynamic> json) {
    steps = json["step"];
  }
}
