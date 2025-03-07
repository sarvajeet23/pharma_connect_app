import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_connect_app/model/profile_model.dart';
import '../../controllers/profile/profile_controller.dart';
import '../../utility/notification_badges.dart';

class EditDetailsPage extends StatefulWidget {
  @override
  _EditDetailsPageState createState() => _EditDetailsPageState();
}

class _EditDetailsPageState extends State<EditDetailsPage> {
  final ProfileController profileController = Get.find<ProfileController>();

  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _practitionerIdController;
  late TextEditingController _billingAddressController;

  var isSaving = false.obs;

  @override
  void initState() {
    super.initState();
    final profile = profileController.profile.value;
    _nameController = TextEditingController(text: profile.name);
    _emailController = TextEditingController(text: profile.email);
    _phoneController = TextEditingController(text: profile.phone);
    _practitionerIdController = TextEditingController(
      text: profile.practitionerId,
    );
    _billingAddressController = TextEditingController(
      text: profile.billingAddress,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _practitionerIdController.dispose();
    _billingAddressController.dispose();
    super.dispose();
  }

  Future<void> _saveDetails() async {
    if (_formKey.currentState!.validate()) {
      log("Saving profile details...");
      isSaving.value = true;

      ProfileModel updatedProfile = ProfileModel(
        id: profileController.profile.value.id,
        name: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        email: _emailController.text.trim(),
        practitionerId: _practitionerIdController.text.trim(),
        billingAddress: _billingAddressController.text.trim(),
      );

      log("Updated Profile Data: $updatedProfile");

      try {
        await profileController.saveProfileDetails(updatedProfile);
        log("Profile saved successfully!");

        isSaving.value = false;

        Get.snackbar(
          "Success",
          "Profile updated successfully!",
          snackPosition: SnackPosition.BOTTOM,
        );

        // **Try manually popping the screen**
        if (Get.isDialogOpen ?? false) {
          Get.back(); // Close any open dialogs first
        }
        if (Navigator.canPop(context)) {
          Navigator.of(context).pop();
        } else {
          Get.offNamed('/profile'); // Manually navigate back to profile
        }
      } catch (e) {
        log("Error saving profile: $e");
        isSaving.value = false;

        Get.snackbar(
          "Error",
          "Failed to update profile. Please try again.",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      log("Validation failed! Some fields are empty or invalid.");
    }
  }

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
        title: const Text('Edit Details'),
        actions: [NotificationBadge(notificationCount: notificationCount)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextField("Name", _nameController),
                _buildTextField("Email", _emailController, isEmail: true),
                _buildTextField("Phone", _phoneController, isPhone: true),
                _buildTextField("Practitioner ID", _practitionerIdController),
                _buildTextField("Billing Address", _billingAddressController),
                const SizedBox(height: 20),
                Obx(
                  () =>
                      isSaving.value
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                            onPressed: _saveDetails,
                            child: const Text("Save"),
                          ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool isPhone = false,
    bool isEmail = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType:
            isPhone
                ? TextInputType.phone
                : isEmail
                ? TextInputType.emailAddress
                : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field cannot be empty';
          }
          if (isPhone && !RegExp(r'^\d{10,15}$').hasMatch(value)) {
            return 'Enter a valid phone number';
          }
          if (isEmail &&
              !RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+$",
              ).hasMatch(value)) {
            return 'Enter a valid email address';
          }
          return null;
        },
      ),
    );
  }
}
