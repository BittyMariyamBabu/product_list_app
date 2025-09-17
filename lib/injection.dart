import 'package:get_it/get_it.dart';
import 'package:product_listing_app/core/network/api_services.dart';
import 'package:product_listing_app/feature/home/data/repositories/home_repository_impl.dart';
import 'package:product_listing_app/feature/home/domain/repositories/home_repository.dart';
import 'package:product_listing_app/feature/home/domain/usecases/get_product_usecases.dart';
import 'package:product_listing_app/feature/home/presentation/bloc/product/product_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ApiService
  sl.registerLazySingleton<ApiService>(() => ApiServiceImpl());

  // Repository (use the registered ApiService)
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(apiClient:sl()), 
  );

  // UseCase
  sl.registerLazySingleton(() => GetProductsUseCase(sl())); 

  // Bloc
  sl.registerFactory(() => ProductBloc(sl())); 
}
