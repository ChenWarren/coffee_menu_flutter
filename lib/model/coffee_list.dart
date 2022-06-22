class CoffeeList {
  final List<Coffee> coffees;

  CoffeeList({
    required this.coffees,
  });

  factory CoffeeList.fromJson(List<dynamic> parsedJson) {
    List<Coffee> coffees;
    coffees = parsedJson.map((i)=>Coffee.fromJson(i)).toList();
    return CoffeeList( coffees: coffees);
  }
}

class Coffee {
  final int id;
  final String title;
  final String description;
  final String image;

  Coffee(
      {required this.id,
      required this.title,
      required this.description,
      required this.image});

  factory Coffee.fromJson(Map<String, dynamic> json) {
    return Coffee(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      image: json["image"],
    );
  }
}
