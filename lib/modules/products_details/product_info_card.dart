import 'package:flutter/material.dart';

class ProductInfoCard extends StatefulWidget {
  const ProductInfoCard({super.key});

  @override
  State<ProductInfoCard> createState() => _ProductInfoCardState();
}

class _ProductInfoCardState extends State<ProductInfoCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Product Information",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Dr. Odin BPC80A 3H Blood Pressure Machine is a fully automatic digital blood pressure monitor device that enables a high-speed and reliable measurement of systolic and diastolic blood pressure as well as the pulse through the oscillometric method.",
            style: TextStyle(fontSize: 14),
          ),
          if (_isExpanded) ...[
            const SizedBox(height: 12),
            const Text(
              "Uses:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              "• It is used for measuring the blood pressure of individuals.",
            ),
            const SizedBox(height: 12),
            const Text(
              "Product Features And Specifications:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              "• It has a portable design which makes it easy to carry.",
            ),
            const Text(
              "• It has an automatic shutdown function which saves power.",
            ),
            const Text(
              "• It can support 3 users at a time with 120 memories each.",
            ),
            const Text("• It helps to measure irregular heartbeats as well."),
            const Text("• It comes with a large LED display."),
            const Text(
              "• It has a dual power mode: USB power or 4x AA batteries.",
            ),
            const Text(
              "• It has an average value function that helps analyze blood pressure patterns.",
            ),
            const Text("• It has a one-button easy operation."),
            const SizedBox(height: 12),
            const Text(
              "Directions For Use:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text("• Use as directed on the label."),
            const SizedBox(height: 12),
            const Text(
              "Safety Information:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              "• Store in a cool and dry place away from direct sunlight.",
            ),
            const Text("• Read the product manual carefully before use."),
            const Text("• Keep out of reach of children."),
          ],
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Text(_isExpanded ? "View Less ▲" : "View More ▼"),
            ),
          ),
        ],
      ),
    );
  }
}
