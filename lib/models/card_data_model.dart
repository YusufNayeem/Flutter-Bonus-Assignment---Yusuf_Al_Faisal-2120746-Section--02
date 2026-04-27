import 'package:flutter/widgets.dart';

class CardDataModel {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final DateTime createdAt;
  final IconData? icon;

  CardDataModel({
    this.id = '',
    required this.title,
    required this.subtitle,
    this.description = '',
    DateTime? createdAt,
    this.icon,
  }) : createdAt = createdAt ?? DateTime.now();

  @override
  String toString() {
    return "CardDataModel(id: $id, title: $title, subtitle: $subtitle, description: $description, createdAt: $createdAt, icon: $icon)";
  }
}