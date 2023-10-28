import 'package:esensi_solusi_buana_test/helpers/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
        Positioned(
          left: -50,
          right: -50,
          top: 0,
          bottom: 0,
          child: Transform.scale(
            scale: 1.3,
            child: Image.asset(
              'assets/pokemon/background_pokemon.png',
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        )
            .animate(
              onComplete: (controller) {
                controller.repeat(reverse: true);
              },
            )
            .moveX(
                delay: 5.seconds,
                duration: 1500.milliseconds,
                begin: 0,
                end: 120,
                curve: Curves.easeInOut)
            .then(delay: 5.seconds),
        Positioned(
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.white,
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(0, 0))
                ],
                borderRadius: BorderRadius.circular(
                  20,
                )),
            height: 30,
          )
              .animate(
                onComplete: (controller) {
                  controller.repeat(reverse: true);
                },
              )
              .moveY(
                  delay: 5.seconds,
                  duration: 1500.milliseconds,
                  begin: -30,
                  end: context.getSize.height,
                  curve: Curves.easeInOut)
              .then(delay: 5.seconds),
        ),
        Positioned.fill(
          child: child,
        ),
      ],
    );
  }
}
