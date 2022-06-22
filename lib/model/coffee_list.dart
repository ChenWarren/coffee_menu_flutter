
class Coffee {
  final int id;
  final String title;
  final String description;
  final String image;

  Coffee(
      {required this.id,
      required this.title,
      required this.description,
      required this.image
  });

  factory Coffee.fromJson(Map<String, dynamic> json) {
    return Coffee(
      id: json["id"] as int,
      title: json["title"] as String,
      description: json["description"] as String,
      image: json["image"] as String,
    );
  }
}
