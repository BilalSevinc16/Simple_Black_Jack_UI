import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget heart() {
  return Icon(
    CupertinoIcons.heart_fill,
    color: Colors.red.shade800,
    size: 60,
  );
}

Widget diamond() {
  return Icon(
    CupertinoIcons.suit_diamond_fill,
    color: Colors.red.shade800,
    size: 60,
  );
}

Widget spade() {
  return const Icon(
    CupertinoIcons.suit_spade_fill,
    color: Colors.black,
    size: 60,
  );
}

Widget club() {
  return const Icon(
    CupertinoIcons.suit_club_fill,
    color: Colors.black,
    size: 60,
  );
}
