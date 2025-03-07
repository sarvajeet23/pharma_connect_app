import 'package:flutter/material.dart';
import 'package:pharma_connect_app/model/cart_model.dart';
import 'package:pharma_connect_app/modules/cart/components/cart_list.dart';
import '../../utility/notification_badges.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final int notificationCount = 2;

    final List<CartModel> cartItems = List.generate(
      5,
      (index) => CartModel(
        image: "assets/image 5983.png",
        itemCount: index + 1,
        label: "Blood Pressure Moniter",
        price: (index + 1) * 50.0,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            gradient: LinearGradient(
              colors: [Color(0xFF3AADA9), Color(0xFF1E8380)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        title: const Text('Cart'),
        actions: [NotificationBadge(notificationCount: notificationCount)],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:
                cartItems
                    .map(
                      (cartItem) => CartList(
                        image: cartItem.image,
                        item: cartItem.itemCount,
                        label: cartItem.label,
                        price: cartItem.price,
                      ),
                    )
                    .toList(),
          ),
        ),
      ),
    );
  }
}
