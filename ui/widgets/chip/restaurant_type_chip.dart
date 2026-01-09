// Widget to disaply a restaurant stars chip
import 'package:flutter/material.dart';

class RestaurantTypeChip extends StatelessWidget {
  final String label;
  final Color color;
  const RestaurantTypeChip({
    super.key,
    required this.label,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      side: const BorderSide(
        color: Color.fromARGB(255, 199, 199, 199)
      ),
      backgroundColor: color,
      label: Text(label.toUpperCase(), style: const TextStyle(fontSize: 18))
    );
  }
}