import 'package:flutter/material.dart';
import 'package:pharma_connect_app/modules/my_order/order_card.dart';

import '../../utility/notification_badges.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final int notificationCount = 2;
    final List<Map<String, String>> orders = [
      {"id": "123456", "status": "Delivered"},
      {"id": "123457", "status": "In Transit"},
      {"id": "123458", "status": "Delivered"},
      {"id": "123459", "status": "In Transit"},
      {"id": "123456", "status": "Delivered"},
      {"id": "123457", "status": "In Transit"},
      {"id": "123458", "status": "Delivered"},
      {"id": "123459", "status": "In Transit"},
    ];
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
        title: const Text('My Orders'),
        actions: [NotificationBadge(notificationCount: notificationCount)],
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return OrderCard(
            orderId: orders[index]["id"]!,
            status: orders[index]["status"]!,
          );
        },
      ),
    );
  }
}
