import 'package:flutter/material.dart';

class CustomButtonIconWidget extends StatelessWidget {
  const CustomButtonIconWidget(
      {super.key,
      this.onPressed,
      required this.icon,
      required this.label,
      this.isOutline = false});

  final void Function()? onPressed;
  final Widget icon;
  final Widget label;
  final bool isOutline;

  @override
  Widget build(BuildContext context) {
    if (isOutline) {
      return OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: Colors.white,
          ),
        ),
        icon: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 1.5,
            ),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(2),
          child: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: icon,
          ),
        ),
        label: label,
      );
    }
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1.5,
          ),
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(2),
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: icon,
        ),
      ),
      label: label,
    );
  }
}
