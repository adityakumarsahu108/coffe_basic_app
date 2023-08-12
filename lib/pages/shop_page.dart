import 'package:flutter/material.dart';
import 'package:flutter_application_coffe_app/components/coffee_tile.dart';
import 'package:flutter_application_coffe_app/models/coffee_shop.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add to cart
  void addToCart(Coffee coffee) {
    //add to cart
    Provider.of<CoffeShop>(context, listen: false).addItemToCart(coffee);

    // let user know it has been successfully addded

    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text("Successfully added to cart!"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //heading message
              const Text(
                "How would you like your coffee?",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
              //list of coffees
              Expanded(
                child: ListView.builder(
                    itemCount: value.coffeShop.length,
                    itemBuilder: (context, index) {
                      // get indivisual coffee
                      Coffee eachCoffee = value.coffeShop[index];

                      //return tile for each coffee
                      return CoffeTile(
                        coffee: eachCoffee,
                        icon: Icon(Icons.add),
                        onPressed: () => addToCart(eachCoffee),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
