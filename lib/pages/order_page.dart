import 'package:cofee_shop/models/coffee.dart';
import 'package:cofee_shop/models/coffee_shop.dart';
import 'package:cofee_shop/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class orderPAge extends StatefulWidget {
  final Coffee coffee;
  const orderPAge({super.key, required this.coffee});

  @override
  State<orderPAge> createState() => _orderPAgeState();
}

class _orderPAgeState extends State<orderPAge> {
  // user can select quantity S, M, L
  int quantity = 1;
  String size = 'Small';

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  void _selectSize(String newSize) {
    setState(() {
      size = newSize;
    });
  }

  void addToCart() {
    // first add to cart
    Provider.of<CoffeeShop>(context, listen: false)
        .addItemToCart(widget.coffee);

    // direct user back to shop page
    Navigator.pop(context);

    // let user know it has been successfully added to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Center(
          child: Text(
            "Successfully added to cart",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coffee.name),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Coffee iamge
            SizedBox(
              child: Image.asset(
                widget.coffee.imagePath,
                height: 200,
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'QUANTITY',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey[200]),
                ),
              ),
            ),

            // Coffee quantity
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: _decrementQuantity,
                    ),
                    Text(
                      quantity.toString(),
                      style: TextStyle(fontSize: 24.0),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: _incrementQuantity,
                    ),
                  ],
                ),

                // Select size
                SizedBox(height: 20.0),
                Text(
                  'Select Size',
                  style: TextStyle(fontSize: 20.0),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          //  size - S
                        },
                        child: Text("S"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          //  size - M
                        },
                        child: Text("M"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          //  size - L
                        },
                        child: Text("L"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // add to cart button
            MaterialButton(
                child: Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.brown,
                onPressed: addToCart)
          ],
        ),
      ),
    );
  }
}
