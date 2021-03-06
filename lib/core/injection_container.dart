import 'package:furniture_shopping_app/business_logic/blocs/auth/auth_bloc.dart';
import 'package:furniture_shopping_app/business_logic/blocs/cart/cart_bloc.dart';
import 'package:furniture_shopping_app/business_logic/blocs/home/home_bloc.dart';
import 'package:furniture_shopping_app/data/data_services/local_data_sources.dart';
import 'package:furniture_shopping_app/data/repositories/auth_repo.dart';
import 'package:furniture_shopping_app/data/repositories/products_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../business_logic/blocs/favorites/favorites_bloc.dart';
import '../business_logic/blocs/user/user_bloc.dart';
import '../business_logic/blocs/products/products_bloc.dart';
import '../data/repositories/cart_repo.dart';
import '../data/repositories/favorites_repo.dart';
import '../data/repositories/user_repo.dart';

final inj = GetIt.instance;
Future<void> init() async {
  // Blocs
  inj.registerFactory(() => AuthBloc(authRepo: inj(), localDataSource: inj()));
  inj.registerFactory(() => HomeBloc(authRepo: inj(), localDataSource: inj()));
  inj.registerFactory(() => ProductsBloc(productsRepo: inj()));
  inj.registerFactory(
      () => UserBloc(authRepo: inj(), localDataSource: inj(), userRepo: inj()));
  inj.registerFactory(() => CartBloc(cartRepo: inj()));
  inj.registerFactory(() => FavoritesBloc(favoritesRepo: inj()));
 
  // Repositories
  inj.registerLazySingleton<AuthRepoImpl>(
      () => AuthRepoImpl(localDataSource: inj()));
  inj.registerLazySingleton<ProductsRepoImpl>(() => ProductsRepoImpl());
  inj.registerLazySingleton<UserRepoImpl>(
      () => UserRepoImpl(localDataSource: inj()));
  inj.registerLazySingleton<CartRepoImpl>(
      () => CartRepoImpl(localDataSource: inj()));
  inj.registerLazySingleton<FavoritesRepoImpl>(
      () => FavoritesRepoImpl(localDataSource: inj()));

  // DataSources
  inj.registerLazySingleton<LocalDataSourceImpl>(
      () => LocalDataSourceImpl(sharedPreferences: inj()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  inj.registerLazySingleton(() => sharedPreferences);
}
