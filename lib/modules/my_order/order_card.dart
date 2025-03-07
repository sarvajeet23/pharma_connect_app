import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final String? orderId;
  final String? status;
  const OrderCard({super.key, this.orderId, this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.only(bottom: 10, left: 16, right: 16, top: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Order.#$orderId"),
                IconButton(
                  icon: const Icon(Icons.arrow_forward, color: Colors.blue),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: Image.asset("assets/image 5985.png"),
            title: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: status,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          status == "Delivered" ? Colors.green : Colors.orange,
                    ),
                  ),
                  const TextSpan(text: " on 21 Apr, 24"),
                ],
              ),
            ),
            subtitle: const Text(
              "+5 items",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing:
                status == "In Transit"
                    ? TextButton(
                      onPressed: () {},
                      child: const Text("Track Order"),
                    )
                    : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
