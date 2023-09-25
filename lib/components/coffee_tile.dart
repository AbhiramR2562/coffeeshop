import 'package:cofee_shop/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  void Function()? onPressed;
  final Widget trailing;

  CoffeeTile({
    super.key,
    required this.coffee,
    required this.onPressed,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: ListTile(
          title: Text(coffee.name),
          subtitle: Text(coffee.price),
          leading: Image.asset(coffee.imagePath),
          trailing: trailing,
        ),
      ),
    );
  }
}
