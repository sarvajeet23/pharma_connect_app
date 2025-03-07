import 'package:flutter/material.dart';

class DrugModel {
  final String? name;
  final String? description;
  final String? image;
  final Color? color;

  DrugModel({
    this.color = Colors.blue,
    this.name,
    this.description,
    this.image,
  });
}
