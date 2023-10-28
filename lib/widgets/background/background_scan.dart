import 'package:flutter/material.dart';

class BackgroundScanWidget extends StatelessWidget {
  const BackgroundScanWidget(
      {super.key, required this.child, this.opacity = .75});

  final Widget child;

  // default 0.75 opacity
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // image party
        Image.asset(
          'assets/pokemon/background_pokemon.png',
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),

        Positioned.fill(
          child: child,
        ),
      ],
    );
  }
}
