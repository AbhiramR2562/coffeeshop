import 'package:cofee_shop/components/coffee_tile.dart';
import 'package:cofee_shop/models/coffee.dart';
import 'package:cofee_shop/models/coffee_shop.dart';
import 'package:cofee_shop/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // Add coffee to cart
  void addToCart(Coffee coffee) {
    // Sdd to cart
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    // Let user know it add been successfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Successfully added to cart"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Heading message
              Text(
                "How would you like your coffee?",
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(
                height: 25,
              ),

              // List of coffee to buy
              Expanded(
                child: ListView.builder(
                    itemCount: value.coffeeShop.length,
                    itemBuilder: (context, index) {
                      // Get individual coffee
                      Coffee eachCoffee = value.coffeeShop[index];

                      // Return the tile coffee
                      return CoffeeTile(
                        coffee: eachCoffee,
                        icon: Icon(Icons.add),
                        onPressed: () => addToCart(eachCoffee),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
