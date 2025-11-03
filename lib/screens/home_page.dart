import 'package:flutter/material.dart';
import 'game_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 158, 3), // dark theme
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🏁 Game Title
              const Text(
                "Checkers Game",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 216, 240, 81),
                  letterSpacing: 1.5,
                ),
              ),

              const SizedBox(height: 40),

              // 🎮 Logo/Icon
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color.fromARGB(255, 41, 33, 33), width: 2),
                ),
                child: const Center(
                  child: Icon(
                    Icons.sports_esports_rounded,
                    color: Color.fromARGB(255, 238, 255, 82),
                    size: 80,
                  ),
                ),
              ),

              const SizedBox(height: 50),

              // ▶️ Start Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(180, 22, 28, 142),
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GamePage()),
                  );
                },
                child: const Text(
                  "START PLAY",
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1.2,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // ℹ️ Developer credit
              const Text(
                "Developed by 14",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
