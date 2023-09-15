import 'package:cofee_shop/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  // Coffee for sale
  final List<Coffee> _shop = [
    // Black coffee
    Coffee(
        name: 'Long Black Coffee',
        price: '4.10',
        imagePath: 'lib/images/coffee.png'),

    // Late
    Coffee(name: 'Late', price: '4.20', imagePath: 'lib/images/latte-art.png'),

    //Espresso
    Coffee(
        name: 'Espresso',
        price: '4.30',
        imagePath: 'lib/images/espresso (1).png'),

    // Iced coffee
    Coffee(
        name: 'cold coffee',
        price: '4.40',
        imagePath: 'lib/images/iced-coffee.png'),

    Coffee(
        name: 'americano',
        price: '4.40',
        imagePath: 'lib/images/americano.png'),

    Coffee(
        name: 'Cold Brew',
        price: '4.40',
        imagePath: 'lib/images/cold-brew.png'),
  ];

  // User Cart
  List<Coffee> _userCart = [];

  // Get coffee list

  List<Coffee> get coffeeShop => _shop;

  // Get user Cart
  List<Coffee> get userCart => _userCart;

  // Add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
