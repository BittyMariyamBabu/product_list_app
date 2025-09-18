import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/feature/wishlist/domain/entities/wishlist_entity.dart';
import 'package:product_listing_app/feature/wishlist/domain/usecases/add_items.dart';
import 'package:product_listing_app/feature/wishlist/domain/usecases/get_items.dart';
import 'package:product_listing_app/feature/wishlist/domain/usecases/remove_items.dart';
import 'package:product_listing_app/feature/wishlist/presentation/bloc/wishlist_event.dart';
import 'package:product_listing_app/feature/wishlist/presentation/bloc/wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final GetWishListUseCase getWishList;
  final ToggleProductUseCase toggleProduct;
  final SyncWishlistUseCase syncWishlist;

  WishlistBloc({
    required this.getWishList,
    required this.toggleProduct,
    required this.syncWishlist,
  }) : super(WishlistInitial()) {
    on<LoadWishlist>((event, emit) async {
      emit(WishlistLoading());
      try {
        final wishlist = await getWishList();
        emit(WishlistLoaded(wishlist));
      } catch (e) {
        emit(WishlistError(e.toString()));
      }
    });

    on<ToggleWishlist>((event, emit) async {
      if (state is WishlistLoaded) {
        await toggleProduct(event.productId);

        // Current list
        final current = (state as WishlistLoaded).wishlist;
        final updated = List<WishListEntity>.from(current);

        // Find if product already in wishlist
        final index = updated.indexWhere((item) => item.id == event.productId);

        if (index >= 0) {
          // Remove product
          updated.removeAt(index);
        } else {
          // Add a minimal entity (fallback values for missing fields)
          updated.add(
            WishListEntity(
              id: int.parse(event.productId),       
              salePrice: 0,
              actualPrice: 0,
              imageUrl: '',
              productName: '',
              review: 0,
            ),
          );
        }

        emit(WishlistLoaded(updated));
      }
    });


    on<SyncWishlist>((event, emit) async {
      try {
        await syncWishlist();
      } catch (e) {
        emit(WishlistError(e.toString()));
      }
    });
  }
}