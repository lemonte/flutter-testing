import 'package:flutter/material.dart';

class ProgressPoint extends StatelessWidget {
  final Color color;

  const ProgressPoint({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 8,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
