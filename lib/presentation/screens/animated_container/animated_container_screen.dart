import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10;
  late Timer periodicTime;
  bool shouldStop = true;

  void changeShape() {
    final random = Random();
    width = random.nextInt(300) + 120;
    height = random.nextInt(300) + 120;
    borderRadius = random.nextDouble() * 20;
    color = Color.fromRGBO(random.nextInt(255), random.nextInt(255),
        random.nextInt(255), random.nextDouble() * 10);
    setState(() {});
  }

  void setPeriodicTimer() => periodicTime = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          changeShape();
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Container")),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOutCubic,
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(borderRadius)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            shouldStop = !shouldStop;

            setState(() {
              if (shouldStop) {
                periodicTime.cancel();
              } else {
                setPeriodicTimer();
              }
            });
          },
          child: shouldStop ? Icon(Icons.play_arrow) : Icon(Icons.pause)),
    );
  }
}
