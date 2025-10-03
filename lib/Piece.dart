import 'package:flutter/material.dart';


class Piece  extends StatelessWidget {


  final bool isKing;
  final String color;
  final double size;

  const Piece({
    Key? key,
    this.color='white',

    this.isKing = true,
    this.size=40.0,


  }): super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height:size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color == 'white' ? Colors.white : Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
          if (isKing)
          BoxShadow(
            color: Colors.yellow.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),


    ],
      border: Border.all(color: Color(0xff000000),width: 2),),
      child: isKing
      ?Center(
        child: Icon(
          Icons.star,
            color: Colors.limeAccent,
            size: size*10,),
      ):null





    );

  }
}
