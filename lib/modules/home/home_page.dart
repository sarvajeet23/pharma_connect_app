import 'package:flutter/material.dart';
import 'package:pharma_connect_app/model/drug_model.dart';

import 'package:pharma_connect_app/modules/home/components/drugs_card.dart';
import 'package:pharma_connect_app/modules/home/components/image_width_indicator.dart';
import 'package:pharma_connect_app/modules/products_details/details_page.dart';
import 'package:pharma_connect_app/utility/notification_badges.dart';

class HomePage extends StatelessWidget {
  final List<DrugModel> drugData = [
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
      description: "Dr. Morepen Blood Pressure Monitor Model Bp 14",
      image: "assets/image 5983.png",
    ),
    DrugModel(
      color: Color(0xFFDAF7DF),
      name: "Cetirizine",
      description: "Revital Cal 500mg Strip Of 15 Tablets",
      image: "assets/image 5984.png",
    ),
    DrugModel(
      color: Color(0xFFFFE9E9),
      name: "Metformin",
      description: "Revital Cal 500mg Strip Of 15 Tablets",
      image: "assets/image 5985.png",
    ),
    DrugModel(
      color: Color(0xFFFFF3D0),
      name: "Aspirin",
      description: "Recombigen Dr. ORG New 3 In 1 Vaporizer",
      image: "assets/image 5986.png",
    ),
    DrugModel(
      color: Color(0xFFD9F6FF),
      name: "Cough Syrup",
      description: "Dr. Morepen Blood Pressure Monitor Model Bp 14",
      image: "assets/image 5987.png",
    ),
    DrugModel(
      color: Color(0xFFDAF7DF),
      name: "Omeprazole",
      description: "Revital Cal 500mg Strip Of 15 Tablets",
      image: "assets/image 5988.png",
    ),
  ];
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final int notificationCount = 2;
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
        title: const Text('PharmaConnect'),
        actions: [NotificationBadge(notificationCount: notificationCount)],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ImageCarouselWithIndicator(),
              const SizedBox(height: 16),
              const Text(
                'Sample Drugs',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const Text(
                'List of drugs assigned to you',
                style: TextStyle(color: Colors.black38),
              ),
              const SizedBox(height: 16),

              SizedBox(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    mainAxisExtent: 220,
                  ),
                  itemBuilder: (context, index) {
                    DrugModel model = drugData[index];
                    return DrugsCard(
                      drugName: model.description,
                      drugImage: model.image,
                      color: model.color,

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(drugData: model),
                          ),
                        );
                      },
                    );
                  },
                  itemCount: drugData.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
