import 'dart:ui'; // For the Color class

// You'll need to define what a 'Peice' is.
// If it's in another file (e.g., peice.dart), import it:
// import 'peice.dart';

// Placeholder for your Peice class if not defined elsewhere
class Peice {
  // Example properties for a Peice
  final String type; // e.g., "pawn", "king"
  final Color color; // e.g., player's color

  Peice({required this.type, required this.color});
}

class Square { // Remove "extends peice"
  final int row;
  final int column;
  final Color squareColor;
  Peice? piece; // This is where the Square can hold a Peice

  Square({
    required this.row,
    required this.column,
    required this.squareColor,
    this.piece, // A square can optionally have a piece
  });

  bool get hasPiece => piece != null;

  void clearPiece() {
    piece = null;
  }

  void placePiece(Peice newPiece) {
    piece = newPiece;
  }
}
