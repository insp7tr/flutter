import 'package:ecommerce_app_2/models/models.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  Map productQuantity(List<Product> products) {
    var quantity = {};

    for (var product in products) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    }

    return quantity;
  }

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(subtotal) {
    if (subtotal >= 50.0) {
      return 0;
    } else {
      return 10.0;
    }
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 50) {
      return "You have Free Delivery";
    } else {
      double missing = 50.0 - subtotal;
      return "Add R${missing.toStringAsFixed(2)} for FREE delivery";
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee;
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString =>
      total(subtotal, deliveryFee(subtotal)).toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subtotal);

  @override
  List<Object?> get props => [products];
}
