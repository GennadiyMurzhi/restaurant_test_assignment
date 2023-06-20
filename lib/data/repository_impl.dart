import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_assignment_effective/domain/category.dart';
import 'package:test_assignment_effective/domain/dish.dart';
import 'package:test_assignment_effective/domain/repository.dart';

part 'repository_impl.g.dart';

@RestApi(baseUrl: "https://run.mocky.io/v3/")
abstract class RepositoryImpl implements Repository {
  factory RepositoryImpl(Dio dio, {String baseUrl}) = _RepositoryImpl;

  @GET("/058729bd-1402-4578-88de-265481fd7d54")
  @override
  Future<Categories> getCategoriesFromServer();

  @GET("/aba7ecaa-0a70-453b-b62d-0e326c859b3b")
  @override
  Future<Dishes> getDishesFromServer();

}