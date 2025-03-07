import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_connect_app/model/drug_model.dart';
import 'package:pharma_connect_app/modules/home/components/drugs_card.dart';
import 'package:pharma_connect_app/modules/home/components/image_width_indicator.dart';
import 'package:pharma_connect_app/modules/products_details/product_info_card.dart';
import 'package:pharma_connect_app/utility/notification_badges.dart' as utility;

import '../../controllers/profile/details_controller.dart'
    show DetailsController;

class DetailsPage extends StatelessWidget {
  final DrugModel? drugData;
  DetailsPage({super.key, this.drugData});

  final DetailsController controller = Get.put(DetailsController());

  final List<DrugModel> drugsData = [
    DrugModel(
      color: Color(0xFFFFE9E9),
      name: "Paracetamol",
      description: "Revital Cal 500mg Strip Of 15 Tablets",
      image: "assets/image 5981.png",
    ),
    DrugModel(
      color: Color(0xFFFFF3D0),
      name: "Amoxicillin",
      description: "Recombigen Dr. ORG New 3 In 1 Vaporizer",
      image: "assets/image 5982.png",
    ),
    DrugModel(
      color: Color(0xFFD9F6FF),
      name: "Ibuprofen",
      description: "Anti-inflammatory and pain relief medicine.",
      image: "assets/image 5983.png",
    ),
    DrugModel(
      color: Color(0xFFDAF7DF),
      name: "Cetirizine",
      description: "Antihistamine used for allergies.",
      image: "assets/image 5984.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF3AADA9), Color(0xFF1E8380)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        title: const Text('Dr. Morepen Blood Pressure...'),
        actions: [
          Obx(
            () => utility.NotificationBadge(
              notificationCount: controller.notificationCount.value,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageCarouselWithIndicator(
              images: List.generate(3, (index) {
                return drugData!.image ?? '';
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                "Dr. Odin BPCBOA 3H Blood Pressure\nMachine",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: Row(
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "FREE ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "Sample",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text("TRIAL"),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "Maximum of 12 units can be added to the cart.",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 10),
            const ProductInfoCard(),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.teal[100],
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Especially for you",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "List of drugs assigned to you",
                    style: TextStyle(color: Colors.black38, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          mainAxisExtent: 200,
                        ),
                    itemCount: drugsData.length,
                    itemBuilder: (context, index) {
                      DrugModel model = drugsData[index];
                      return DrugsCard(
                        drugName: model.description,
                        drugImage: model.image,
                        color: model.color,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 60,
          padding: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, -2),
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: controller.decreaseQuantity,
                        icon: const Icon(Icons.remove),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "${controller.quantity.value}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: controller.increaseQuantity,
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: controller.placeOrder,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF10676E),
                  shape: RoundedRectangleBorder(),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 46,
                    vertical: 20,
                  ),
                ),
                child: const Text("Place Order >"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
