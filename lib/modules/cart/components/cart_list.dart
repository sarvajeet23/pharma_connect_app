import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  final String? image;
  final String? label;
  final int? item;
  final double? price;
  const CartList({super.key, this.image, this.label, this.item, this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      elevation: 0.5,
      child: ListTile(
        leading: Image.asset(image!),
        title: Text(
          label ?? "null",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Item: ",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              TextSpan(
                text: item.toString(),
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        trailing: Text(
          "₹$price",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }
}
