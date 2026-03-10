# 🏁 Checkers Game - Flutter 

A modern, cross-platform Checkers (Draughts) game built with Flutter and Firebase. This project features a clean UI, real-time synchronization, and secure user authentication.

---

## 🚀 Features

- **👤 User Authentication**: Secure login and registration powered by Firebase Auth.
- **🎮 Smooth Gameplay**: Intuitive drag-and-drop (or tap-based) mechanics for moving pieces.
- **🔥 Real-time Backend**: Integrated with Firebase Realtime Database for future multiplayer support.
- **📱 Responsive Design**: Works seamlessly on Android, iOS, and Web.
- **🏗️ Clean Architecture**: Organized with dedicated models, screens, and widgets for scalability.

---

## 🛠️ Technology Stack

- **Framework**: [Flutter](https://flutter.dev/) (SDK ^3.9.2)
- **Language**: [Dart](https://dart.dev/)
- **Backend Services**: 
  - [Firebase Auth](https://firebase.google.com/products/auth) 🔑
  - [Firebase Database](https://firebase.google.com/products/realtime-database) 🔥
- **State Management**: Reactive UI with Flutter’s built-in state management.

---

## 📁 Project Structure

```text
lib/
├── models/         # Game logic (Board, Piece, Square)
├── screens/        # UI Pages (Home, Game, Login, Register)
├── widgets/        # Reusable UI components
├── main.dart       # Application entry point
└── firebase_options.dart # Firebase configuration
```

---

## ⚙️ Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
- [Firebase project](https://console.firebase.google.com/) set up.

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/ushanvidu/Checkers_Game.git
   cd Checkers_Game
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**:
   - Ensure you have the `firebase_options.dart` file configured (or run `flutterfire configure`).
   - Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) files to the respective folders if not using FlutterFire.

4. **Run the app**:
   ```bash
   flutter run
   ```

---

## 🤝 Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
