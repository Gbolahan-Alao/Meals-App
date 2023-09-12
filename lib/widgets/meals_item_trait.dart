import 'package:flutter/material.dart';

class MealsItemTrait extends StatelessWidget {
  const MealsItemTrait({
    super.key,
    required this.label,
    required this.icon,
  });
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 2,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
