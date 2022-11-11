import 'package:ecommerce_app_2/models/models.dart';
import 'package:equatable/equatable.dart';

class Wishlist extends Equatable {
  final List<Product> products;

  const Wishlist({
    this.products = const <Product>[],
  });

  @override
  List<Object?> get props => [products];
}
