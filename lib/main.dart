import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const CheckersApp());
}

class CheckersApp extends StatelessWidget {
  const CheckersApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Checkers Board'), centerTitle: true),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            //child: BoardWidget(board: board),
            child: HomePage(),
          ),
        ),
      ),
    );
  }
}
