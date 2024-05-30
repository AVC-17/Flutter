import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.boxIcon, required this.boxText});

  final IconData boxIcon;
  final String boxText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          boxIcon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          boxText,
          style: const TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}
