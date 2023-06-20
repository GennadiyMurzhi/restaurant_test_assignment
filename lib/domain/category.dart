import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Categories extends Equatable {
  const Categories({
    required this.categories,
  });

  @JsonKey(name: 'сategories')
  final List<Category> categories;

  factory Categories.empty() => Categories(
        categories: List<Category>.empty(),
      );

  factory Categories.fromJson(Map<String, dynamic> json) => _$CategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);

  Categories copyWith({
    List<Category>? categories,
  }) =>
      Categories(
        categories: categories ?? this.categories,
      );

  @override
  List<Object> get props => [categories];
}

@JsonSerializable()
class Category extends Equatable {
  const Category({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  final int id;
  final String name;
  @JsonKey(name: 'image_url')
  final String imageUrl;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  Category copyWith({
    int? id,
    String? name,
    String? imageUrl,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  @override
  List<Object> get props => [id, name, imageUrl];
}
