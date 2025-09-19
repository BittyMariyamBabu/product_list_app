import 'package:flutter/widgets.dart';
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
      debugPrint("WishList loading");
      try {
        final wishlist = await getWishList();
        emit(WishlistLoaded(wishlist));
        debugPrint("WishList laoded");
      } catch (e) {
        emit(WishlistError(e.toString()));
      }
    });

    /// Toggle product in wishlist
    on<ToggleWishlist>((event, emit) async {
      if (state is WishlistLoaded) {
        final currentState = state as WishlistLoaded;

        // update local list first
        List<WishListEntity> updatedWishlist = List.from(currentState.wishlist);

        if (updatedWishlist.any((p) => p.id == event.product.id)) {
          updatedWishlist.removeWhere((p) => p.id == event.product.id);
          debugPrint("Removing from wishlist: ${event.product.id}");
        } else {
          updatedWishlist.add(event.product);
          debugPrint("Adding to wishlist: ${event.product.id}");
        }

        // Emit updated state immediately
        emit(WishlistLoaded(updatedWishlist));

        try {
          // Update repository cache and backend
          await toggleProduct(event.product.id.toString());
          await syncWishlist();
        } catch (e) {
          // Revert changes if API fails
          emit(currentState);
        }
      }
    });

    on<SyncWishlist>((event, emit) async {
      try {
        await syncWishlist();
        debugPrint("Wishlist synced successfully");
      } catch (e) {
        emit(WishlistError(e.toString()));
      }
    });
  }
}