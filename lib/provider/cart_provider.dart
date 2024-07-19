import 'package:flutter/material.dart';
import 'package:medical_store_app/Models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductModel> _cart = [];

  List<ProductModel> get cart => _cart;

  void addToCart(ProductModel product, int selectedIndex) {
    int existingIndex =
        _cart.indexWhere((element) => element.title == product.title);

    if (existingIndex != -1) {
      _cart[existingIndex].quantity++;
    } else {
      product.quantity = 1;
      product.selectedVariantIndex = selectedIndex;
      _cart.add(product);
    }

    notifyListeners();
  }

  void incrementQty(int index) {
    _cart[index].quantity++;
    notifyListeners();
  }

  void decrementQty(int index) {
    if (_cart[index].quantity > 1) {
      _cart[index].quantity--;
    } else {
      _cart.removeAt(index);
    }
    notifyListeners();
  }

  void deleteItem(int index) {
    _cart.removeAt(index);
    notifyListeners();
  }

  double totalPrice() {
    double total = 0.0;
    for (ProductModel product in _cart) {
      int selectedIndex = product.selectedVariantIndex;
      total += product.pricelist[selectedIndex].price * product.quantity;
    }
    return total;
  }
}
