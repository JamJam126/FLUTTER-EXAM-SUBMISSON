import 'package:flutter/material.dart';

class StarsChip extends StatelessWidget {
  final double rating;
  const StarsChip({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Chip(
      side: const BorderSide(
        color: Color.fromARGB(255, 199, 199, 199)
      ),
      label: Row(
        children: [
          const Icon(Icons.star, size: 18, color: Color.fromARGB(255, 26, 89, 141)),
          const SizedBox(width: 8),
          Text(rating.toStringAsFixed(1), style: const TextStyle(fontSize: 18))
        ],
      )
    );
  }
}