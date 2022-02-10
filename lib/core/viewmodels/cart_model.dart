

import 'package:e_commerce/core/models/product.dart';

import 'base_model.dart';

class CartModel extends BaseModel {
  List<Product> cart = [];
  Map<String, List<Product>> cartSummary = {};

  int get cartSize {
    return cart.length;
  }

  void addToCart(Product product) {
    cart.add(product);
    notifyListeners();
  }

  List<Product> getCart() {
    return cart;
  }

  Map<String, List<Product>> getCartSummary() {
    cartSummary = {};
    for (var product in cart) {
      var productName = product.name;
      if (productName != null) {
        if (!cartSummary.keys.contains(product.name)) {
          cartSummary[productName] = [product];
        } else {
          var currentProducts = cartSummary[product.name];
          currentProducts?.add(product);
          cartSummary[productName] = currentProducts ?? <Product>[];
        }
      }
    }
    return cartSummary;
  }

  Product? getProduct(int index) {
    var name = cartSummary.keys.elementAt(index);
    return cartSummary[name]?.first;
  }

  int getProductQuantity(int index) {
    var name = cartSummary.keys.elementAt(index);
    return cartSummary[name]?.length ?? 0;
  }

  int get totalCost {
    var cost = 0;
    for (var productName in cartSummary.keys) {
      cost += (cartSummary[productName]?.first.price ?? 0 * (cartSummary[productName]?.length ?? 0));
    }
    return cost;
  }

  void clearCart() {
    cart = [];
    notifyListeners();
  }
}
