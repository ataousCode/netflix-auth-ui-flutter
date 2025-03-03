import 'package:flutter/material.dart';
import 'package:netflix_auth/routes/routes.dart';
import 'package:netflix_auth/theme/app_theme.dart';

void main() {
  runApp(const NetflixApp());
}

class NetflixApp extends StatelessWidget {
  const NetflixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Authentication',
      theme: AppTheme.darkTheme,
      initialRoute: AppRoutes.auth,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
