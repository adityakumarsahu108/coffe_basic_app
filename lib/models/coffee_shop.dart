import 'package:flutter/material.dart';
import 'coffee.dart';

class CoffeShop extends ChangeNotifier {
  //coffe for sale

  final List<Coffee> _shop = [
    //black coffe
    Coffee(
      name: 'Long Black',
      price: "210/-",
      imagePath: "lib/cofee_app/black_coffee.png",
    ),

    //latte
    Coffee(
      name: 'Latte',
      price: "320/-",
      imagePath: "lib/cofee_app/latte_coffee.png",
    ),

    //espresso
    Coffee(
      name: 'Espresso',
      price: "220/-",
      imagePath: "lib/cofee_app/espresso_coffee.png",
    ),

    //iced coffee
    Coffee(
      name: 'Iced Coffee',
      price: "400/-",
      imagePath: "lib/cofee_app/black_coffee.png",
    ),
  ];

  //user cart
  List<Coffee> _userCart = [];

  //get coffee list

  List<Coffee> get coffeShop => _shop;

  //get user cart
  List<Coffee> get userCart => _userCart;

  //add item to the cart
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
