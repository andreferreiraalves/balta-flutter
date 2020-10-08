import 'package:flutter/widgets.dart';
import 'package:shopping_bloc/models/cart-item.model.dart';

class CartBloc extends ChangeNotifier {
  var cart = new List<CartItemModel>();
  double total = 0;

  get() => cart;

  add(CartItemModel item) {
    cart.add(item);
    calculateTotal();
  }

  remove(CartItemModel item) {
    cart.removeWhere((x) => x.id == item.id);
    calculateTotal();
  }

  itemInCart(CartItemModel item) {
    var result = false;
    cart.forEach((x) {
      if (item.id == x.id) result = true;
    });

    return result;
  }

  increate(CartItemModel item) {
    if (item.quantity < 10) {
      item.quantity++;
      calculateTotal();
    }
  }

  decrease(CartItemModel item) {
    if (item.quantity > 1) {
      item.quantity--;
      calculateTotal();
    }
  }

  calculateTotal() {
    total = 0;
    cart.forEach((x) {
      total += (x.price * x.quantity);
    });

    notifyListeners();
  }
}
