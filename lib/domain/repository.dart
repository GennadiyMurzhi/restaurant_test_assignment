import 'package:test_assignment_effective/domain/category.dart';
import 'package:test_assignment_effective/domain/dish.dart';

abstract class Repository {
  Future<Categories> getCategoriesFromServer();

  Future<Dishes> getDishesFromServer();
}
