import 'dart:ui';
import 'Piece.dart';

class Square {
  final int row;
  final int column;
  final Color squareColor;
  Piece? _piece;

  Square({
    required this.row,
    required this.column,
    required this.squareColor,
    Piece? piece,
  }) : _piece = piece;

  Piece? get piece => _piece;
  bool get hasPiece => _piece != null;

  void placePiece(Piece newPiece) => _piece = newPiece;
  void clearPiece() => _piece = null;

  Square copyWith({Piece? piece}) {
    return Square(
      row: row,
      column: column,
      squareColor: squareColor,
      piece: piece ?? _piece,
    );
  }

  @override
  String toString() {
    return 'Square($row, $column, hasPiece: $hasPiece)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Square &&
        other.row == row &&
        other.column == column;
  }

  @override
  int get hashCode => row.hashCode ^ column.hashCode;
}