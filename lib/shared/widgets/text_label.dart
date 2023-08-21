import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String texto;
  const TextLabel({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Text(texto,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500));
  }
}
