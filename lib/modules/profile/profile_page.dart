import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_connect_app/modules/profile/components/info_tile_card.dart';
import 'package:pharma_connect_app/modules/profile/edit_details_page.dart';

import '../../controllers/profile/profile_controller.dart';
import '../../utility/notification_badges.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  ProfilePage({super.key}) {
    profileController.loadUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    const int notificationCount = 2;

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
        title: const Text('Profile'),
        actions: [NotificationBadge(notificationCount: notificationCount)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                final profile = profileController.profile.value;
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                          "assets/profile/Avatar.png",
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profile.name.isNotEmpty
                                  ? profile.name
                                  : "No Name",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                side: const BorderSide(color: Colors.black),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () => Get.to(() => EditDetailsPage()),
                              child: const Text(
                                "Edit details",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 16),
              Obx(() {
                final profile = profileController.profile.value;
                return Column(
                  children: [
                    InfoTileCard("Name", profile.name),
                    InfoTileCard("Phone", profile.phone),
                    InfoTileCard("Email", profile.email),
                    InfoTileCard("Practitioner ID", profile.practitionerId),
                    InfoTileCard("Billing Address", profile.billingAddress),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
