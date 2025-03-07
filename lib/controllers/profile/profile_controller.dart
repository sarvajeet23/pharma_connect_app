import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pharma_connect_app/model/profile_model.dart';

class ProfileController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var profile =
      ProfileModel(
        id: "",
        name: "Dr. Rachel Green",
        phone: "1-800-555-1234",
        email: "rachelgreen@nihmss.com",
        practitionerId: "WERTY26464YY",
        billingAddress: "1234 Health St., Med City, State 56789, USA",
      ).obs;

  Future<void> loadUserProfile() async {
    try {
      DocumentSnapshot doc =
          await _firestore
              .collection('usersProfile')
              .doc(profile.value.email)
              .get();

      if (doc.exists) {
        profile.value = ProfileModel.fromMap(
          doc.id,
          doc.data() as Map<String, dynamic>,
        );
      }
    } catch (e) {
      log("Error loading profile: $e");
    }
  }

  Future<void> saveProfileDetails(ProfileModel updatedProfile) async {
    try {
      if (updatedProfile.id.isEmpty) {
        log("Error:: Profile ID is empty!");
        Get.snackbar(
          "Error",
          "Invalid profile ID",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      log("Saving profile with ID: ${updatedProfile.id}");

      await _firestore
          .collection('usersProfile')
          .doc(updatedProfile.id)
          .set(updatedProfile.toMap(), SetOptions(merge: true));

      profile.value = updatedProfile;

      Get.snackbar(
        "Success",
        "Profile updated successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      log("Error:: $e");
      Get.snackbar(
        "Error",
        "Failed to save details: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
