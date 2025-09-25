import 'package:flutter/material.dart';
class Peice extends StatelessWidget {

  final int id;
  final Color color;
  final bool isKing;
  Sqaure? position;

  const Peice({super.key,
  required this.id,
  required this.color,
  required this.isKing,
  required this.position,});


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
