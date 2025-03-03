import 'package:flutter/material.dart';

class NetflixLogo extends StatelessWidget {
  const NetflixLogo({super.key, this.size = 32});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      'NETFLIX',
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: size,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
      ),
    );
  }
}
