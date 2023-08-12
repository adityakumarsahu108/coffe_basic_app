import 'package:flutter/material.dart';
import 'package:flutter_application_coffe_app/components/coffee_tile.dart';
import 'package:flutter_application_coffe_app/models/coffee_shop.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //remove cart item

  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeShop>(context, listen: false).removeItemFromCart(coffee);
  }
  //pay button

  void payNow() {
    //fill payment here man
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //heading
              Text(
                "Your Cart",
                style: TextStyle(fontSize: 20),
              ),

              //list of cart items
              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                    //get indivisual cart items
                    Coffee eachCoffee = value.userCart[index];

                    //return coffee tile
                    return CoffeTile(
                      coffee: eachCoffee,
                      onPressed: () => removeFromCart(eachCoffee),
                      icon: Icon(Icons.delete),
                    );
                  },
                ),
              ),
              //pay button
              GestureDetector(
                onTap: payNow,
                child: Container(
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Pay Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
