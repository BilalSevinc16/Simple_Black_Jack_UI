import 'dart:math';

import 'package:flutter/material.dart';

class CardTemplate extends StatelessWidget {
  final dynamic suit;
  final Color? color;
  final String? number;

  const CardTemplate({
    Key? key,
    this.suit,
    this.color,
    this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(5),
          color: Colors.white,
          height: 150,
          width: 100,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      number!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ],
                ),
                suit,
                Transform.rotate(
                  angle: pi,
                  child: Row(
                    children: [
                      Text(
                        number!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
