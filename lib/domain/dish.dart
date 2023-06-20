import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dish.g.dart';

@JsonSerializable()
class Dishes extends Equatable {
  const Dishes({
    required this.dishes,
  });

  final List<Dish> dishes;

  factory Dishes.empty() => Dishes(
        dishes: List<Dish>.empty(),
      );

  factory Dishes.fromJson(Map<String, dynamic> json) => _$DishesFromJson(json);

  Map<String, dynamic> toJson() => _$DishesToJson(this);

  Dishes copyWith({
    List<Dish>? dishes,
  }) =>
      Dishes(
        dishes: dishes ?? this.dishes,
      );

  Dishes byTeg(Teg teg) {
    List<Dish> sortedDishes = <Dish>[];
    for (Dish dish in dishes) {
      if (dish.tegs.contains(teg)) {
        sortedDishes.add(dish);
      }
    }

    return Dishes(
      dishes: sortedDishes,
    );
  }

  @override
  List<Object> get props => [dishes];
}

@JsonSerializable()
class Dish extends Equatable {
  const Dish({
    required this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.description,
    required this.imageUrl,
    required this.tegs,
  });

  final int id;
  final String name;
  final double price;
  final int weight;
  final String description;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  final List<Teg> tegs;

  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);

  Map<String, dynamic> toJson() => _$DishToJson(this);

  Dish copyWith({
    int? id,
    String? name,
    double? price,
    int? weight,
    String? description,
    String? imageUrl,
    List<Teg>? tegs,
  }) =>
      Dish(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        weight: weight ?? this.weight,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        tegs: tegs ?? this.tegs,
      );

  @override
  List<Object> get props => [
        id,
        name,
        price,
        weight,
        description,
        imageUrl,
        tegs,
      ];
}

enum Teg {
  @JsonValue('Все меню')
  all,
  @JsonValue('С рисом')
  rice,
  @JsonValue('Салаты')
  salad,
  @JsonValue('С рыбой')
  fish,
}
