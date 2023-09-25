import 'package:cofee_shop/components/coffee_tile.dart';
import 'package:cofee_shop/models/coffee.dart';
import 'package:cofee_shop/models/coffee_shop.dart';
import 'package:cofee_shop/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // user select a coffee, go to order page
  void goToOrderPage(Coffee coffee) {
    // navigate to order page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => orderPAge(
          coffee: coffee,
        ),
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
              const SizedBox(
                height: 25,
              ),

              // Heading message
              Text(
                "How would you like your coffee?",
                style: TextStyle(fontSize: 20, color: Colors.brown[800]),
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
                        onPressed: () => goToOrderPage(eachCoffee),
                        trailing: Icon(Icons.arrow_forward),
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
