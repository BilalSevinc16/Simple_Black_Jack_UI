import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_blackjack_ui/card_back.dart';
import 'package:simple_blackjack_ui/cardtemplate.dart';
import 'package:simple_blackjack_ui/suits.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController!)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardTemplate(
                  color: Colors.black,
                  number: "10",
                  suit: club(),
                ),
                CardTemplate(
                  color: Colors.red,
                  number: "J",
                  suit: heart(),
                ),
              ],
            ),
            Transform.rotate(
              angle: pi / 2,
              child: const CardBack(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardTemplate(
                  color: Colors.black,
                  number: "Q",
                  suit: club(),
                ),
                getFlippingCard(
                  "A",
                  diamond(),
                  Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getFlippingCard(var number, var suit, var color) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.002)
        ..rotateY(pi * _animation!.value),
      child: GestureDetector(
        onTap: () {
          if (_animationStatus == AnimationStatus.dismissed) {
            _animationController!.forward();
          } else {
            _animationController!.reverse();
          }
        },
        child: _animation!.value >= 0.5
            ? const CardBack()
            : CardTemplate(
                color: color,
                number: number,
                suit: suit,
              ),
      ),
    );
  }
}
