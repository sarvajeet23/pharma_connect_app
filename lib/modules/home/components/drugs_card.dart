import 'package:flutter/material.dart';

class DrugsCard extends StatelessWidget {
  final String? units;
  final String? drugName;
  final String? drugImage;
  final Color? color;
  final VoidCallback? onTap;

  const DrugsCard({
    super.key,
    this.units,
    this.drugName,
    this.drugImage,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: color!.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 1,
                      horizontal: 5,
                    ),
                    child: Text(
                      "Allotted: ${units ?? '12'} units",
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                Center(
                  child: Image.asset(
                    drugImage ?? "assets/image 5981.png",
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 20,
                  child: InkWell(
                    onTap: onTap,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 104, 101, 101),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        Text(
          drugName ?? "Revital Cal 500mg Strip Of 15 Tablets",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
