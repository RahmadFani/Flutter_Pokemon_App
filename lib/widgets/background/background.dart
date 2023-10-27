import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key, required this.child, this.opacity = .75});

  final Widget child;

  // default 0.75 opacity
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // image party
        Image.asset(
          'assets/pokemon/party.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        // Background opacity
        _backgroundOpacity,
        Positioned.fill(
          child: child,
        ),
      ],
    );
  }

  Widget get _backgroundOpacity => Opacity(
        opacity: opacity,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0xF2071A30), Color(0xFF000812)],
            ),
          ),
        ),
      );
}
