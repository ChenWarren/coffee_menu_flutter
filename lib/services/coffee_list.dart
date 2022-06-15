class Coffee {
  final int id;
  final String title;
  final String description;
  final List<String> ingredients;
  final String image;

  Coffee(
      {required this.id,
      required this.title,
      required this.description,
      required this.ingredients,
      required this.image});

  factory Coffee.fromJson(Map<String, dynamic> json) {
    return Coffee(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      ingredients: json["ingredients"],
      image: json["image"],
    );
  }
}
