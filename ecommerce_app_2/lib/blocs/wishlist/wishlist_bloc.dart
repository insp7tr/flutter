import 'package:ecommerce_app_2/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<LoadWishlist>(_onLoadWishList);
    on<AddProductToWishlist>(_onAddProductToWishlist);
    on<RemoveProductFromWishlist>(_onRemoveProductFromWishlist);
  }

  void _onLoadWishList(LoadWishlist event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const WishlistLoaded());
    } catch (e) {
      emit(WishlistError());
    }
  }

  void _onAddProductToWishlist(
      AddProductToWishlist event, Emitter<WishlistState> emit) {
    final state = this.state;

    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)..add(event.product),
            ),
          ),
        );
      } on Exception {
        emit(WishlistError());
      }
    }
  }

  void _onRemoveProductFromWishlist(
      RemoveProductFromWishlist event, Emitter<WishlistState> emit) {
    final state = this.state;

    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)
                ..remove(event.product),
            ),
          ),
        );
      } on Exception {
        emit(WishlistError());
      }
    }
  }

  // @override
  // Stream<WishlistState> mapEventToState(
  //   WishlistEvent event,
  // ) async* {
  //   if (event is StartWishlist) {
  //     yield* _mapStartWishlistToState();
  //   } else if (event is AddWishlistProduct) {
  //     yield* _mapAddWishlistProductToState(event, state);
  //   } else if (event is RemoveWishlistProduct) {
  //     yield* _mapRemoveWishlistProductToState(event, state);
  //   }
  // }
}
