class ProfileModel {
  String id;
  String name;
  String phone;
  String email;
  String practitionerId;
  String billingAddress;

  ProfileModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.practitionerId,
    required this.billingAddress,
  });

  factory ProfileModel.fromMap(String id, Map<String, dynamic> data) {
    return ProfileModel(
      id: id,
      name: data["name"] ?? "",
      phone: data["phone"] ?? "",
      email: data["email"] ?? "",
      practitionerId: data["practitionerId"] ?? "",
      billingAddress: data["billingAddress"] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "phone": phone,
      "email": email,
      "practitionerId": practitionerId,
      "billingAddress": billingAddress,
    };
  }
}
