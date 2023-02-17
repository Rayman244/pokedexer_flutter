import 'package:flutter/material.dart';

class BorderedText extends StatelessWidget {
  const BorderedText(
      {super.key,
      required this.title,
      required this.color,
      required this.borderColor,
      this.size = 16,
      this.strokeWidth = 9});
  final String title;
  final Color color;
  final Color borderColor;
  final double? size;
  final double? strokeWidth;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          title,
          style: TextStyle(
            fontFamily: "PokemonSolid",
            fontSize: size,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth ?? 9
              ..color = borderColor,
          ),
        ),
        // Solid text as fill.
        Text(
          title,
          style: TextStyle(
            fontFamily: "PokemonSolid",
            fontSize: size,
            color: color,
          ),
        ),
      ],
    );
  }
}
