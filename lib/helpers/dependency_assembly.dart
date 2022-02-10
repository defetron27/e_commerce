import 'package:e_commerce/core/services/api.dart';
import 'package:e_commerce/core/viewmodels/cart_model.dart';
import 'package:e_commerce/core/viewmodels/product_list_model.dart';
import 'package:get_it/get_it.dart';

GetIt dependencyAssembler = GetIt.instance;

void setupDependencyAssembler() {
  dependencyAssembler.registerLazySingleton(() => API());
  dependencyAssembler.registerFactory(() => ProductListModel());
  dependencyAssembler.registerFactory(() => CartModel());
}