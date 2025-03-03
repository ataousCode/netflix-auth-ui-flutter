import 'package:flutter/material.dart';

class NetflixBackground extends StatelessWidget {
  const NetflixBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.5,
            child: Image.network(
              'https://assets.nflxext.com/ffe/siteui/vlv3/ab180a27-b661-44d7-a6d9-940cb32f2f4a/7fb5e396-cdfe-40b3-b572-5a726350e3cb/US-en-20231009-popsignuptwoweeks-perspective_alpha_website_large.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: Colors.black);
              },
              loadingBuilder: (context, child, loadingProgrss) {
                if (loadingProgrss == null) return child;
                return Container(color: Colors.black);
              },
            ),
          ),
        ),
        SafeArea(child: child),
      ],
    );
  }
}
