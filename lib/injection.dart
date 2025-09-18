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
import 'package:product_listing_app/feature/home/domain/usecases/search_product_usecases.dart';
import 'package:product_listing_app/feature/home/presentation/bloc/product/product_bloc.dart';
import 'package:product_listing_app/feature/profile/data/repositories/user_data_repository_impl.dart';
import 'package:product_listing_app/feature/profile/domain/repositories/user_data_repository.dart';
import 'package:product_listing_app/feature/profile/domain/usecases/get_user_data.dart';
import 'package:product_listing_app/feature/profile/presentation/bloc/user_data_bloc.dart';
import 'package:product_listing_app/feature/wishlist/data/repository/wishlist_repository_impl.dart';
import 'package:product_listing_app/feature/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:product_listing_app/feature/wishlist/domain/usecases/add_items.dart';
import 'package:product_listing_app/feature/wishlist/domain/usecases/get_items.dart';
import 'package:product_listing_app/feature/wishlist/domain/usecases/remove_items.dart';
import 'package:product_listing_app/feature/wishlist/presentation/bloc/wishlist_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  /// Register SecureStorage in your init() function before any repository that depends on it.
  sl.registerLazySingleton<SecureStorage>(() => SecureStorage());
  
  //------------------------------------Register ApiService--------------------------------------//
  sl.registerLazySingleton<ApiService>(() => ApiServiceImpl(sl()));

  // -----------------------------------Repository-----------------------------------------------//
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(apiClient: sl(),secureStorage: sl()), 
  );
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(apiClient:sl()), 
  );
  sl.registerLazySingleton<WishListRepository>(
  () => WishlistRepositoryImpl(apiClient: sl()),
  );
  sl.registerLazySingleton<UserDataRepository>(
    () => UserDataRepositoryImpl(apiClient:sl()), 
  );

  // -----------------------------------Usecase--------------------------------------------------//
  sl.registerLazySingleton(() => RegisterUseCase(sl())); 
  sl.registerLazySingleton(() => SendOtpUseCase(sl())); 
  sl.registerLazySingleton(() => GetProductsUseCase(sl()));
  sl.registerLazySingleton(() => SearchProductsUseCase(sl()));
  sl.registerLazySingleton(() => GetWishListUseCase(sl()));
  sl.registerLazySingleton(() => ToggleProductUseCase(sl()));
  sl.registerLazySingleton(() => SyncWishlistUseCase(sl()));
  sl.registerLazySingleton(() => GetUserDataUseCase(sl()));

  // -----------------------------------Bloc----------------------------------------------------//
  sl.registerFactory(() => AuthBloc(loginUseCase:sl(),signupUseCase: sl())); 
  sl.registerFactory(() => ProductBloc(getProducts: sl(), searchProducts: sl())); 
  sl.registerFactory(() => UserDataBloc(sl())); 
  sl.registerFactory(() => WishlistBloc(
      getWishList: sl(),
      toggleProduct: sl(),
      syncWishlist: sl(),
));
}
