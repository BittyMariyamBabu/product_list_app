import 'package:get_it/get_it.dart';
import 'package:product_listing_app/core/network/api_services.dart';
import 'package:product_listing_app/core/secure_storage/secure_storage.dart';
import 'package:product_listing_app/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:product_listing_app/feature/auth/domain/repsoitories/auth_repository.dart';
import 'package:product_listing_app/feature/auth/domain/usecases/register_usecase.dart';
import 'package:product_listing_app/feature/auth/domain/usecases/send_otp.dart';
import 'package:product_listing_app/feature/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:product_listing_app/feature/home/data/repositories/home_repository_impl.dart';
import 'package:product_listing_app/feature/home/domain/repositories/home_repository.dart';
import 'package:product_listing_app/feature/home/domain/usecases/get_product_usecases.dart';
import 'package:product_listing_app/feature/home/presentation/bloc/product/product_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  /// Register SecureStorage in your init() function before any repository that depends on it.
  sl.registerLazySingleton<SecureStorage>(() => SecureStorage());
  
  //Register ApiService
  sl.registerLazySingleton<ApiService>(() => ApiServiceImpl());

  // Repository (use the registered ApiService)
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(apiClient:sl()), 
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(apiClient: sl(),secureStorage: sl()), 
  );

  // UseCase
  sl.registerLazySingleton(() => GetProductsUseCase(sl())); 
  sl.registerLazySingleton(() => SendOtpUseCase(sl())); 
  sl.registerLazySingleton(() => RegisterUseCase(sl())); 

  // Bloc
  sl.registerFactory(() => ProductBloc(sl())); 
  sl.registerFactory(() => AuthBloc(loginUseCase:sl(),signupUseCase: sl())); 
}
