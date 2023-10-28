import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarTransparant extends StatelessWidget {
  const AppBarTransparant(
      {super.key, required this.title, this.color = Colors.white});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
                letterSpacing: 0.16,
              ),
            ),
          ),
          if (GoRouter.of(context).canPop())
            IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: Icon(
                CupertinoIcons.back,
                color: color,
              ),
            )
        ],
      ),
    );
  }
}
