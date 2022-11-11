import 'package:ecommerce_app_2/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCart>(_onLoadWishList);
    on<AddProductToCart>(_onAddProductToCart);
    on<RemoveProductFromCart>(_onRemoveProductFromCart);
  }

  void _onLoadWishList(LoadCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const CartLoaded());
    } catch (e) {
      emit(CartError());
    }
  }

  void _onAddProductToCart(AddProductToCart event, Emitter<CartState> emit) {
    final state = this.state;

    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from(state.cart.products)..add(event.product),
            ),
          ),
        );
      } on Exception {
        emit(CartError());
      }
    }
  }

  void _onRemoveProductFromCart(
      RemoveProductFromCart event, Emitter<CartState> emit) {
    final state = this.state;

    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from(state.cart.products)..remove(event.product),
            ),
          ),
        );
      } on Exception {
        emit(CartError());
      }
    }
  }

  // @override
  // Stream<CartState> mapEventToState(
  //   CartEvent event,
  // ) async* {
  //   if (event is StartCart) {
  //     yield* _mapStartCartToState();
  //   } else if (event is AddCartProduct) {
  //     yield* _mapAddCartProductToState(event, state);
  //   } else if (event is RemoveCartProduct) {
  //     yield* _mapRemoveCartProductToState(event, state);
  //   }
  // }
}
