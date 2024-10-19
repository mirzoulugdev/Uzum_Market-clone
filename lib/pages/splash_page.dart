import 'package:flutter/material.dart';

import '../components/constants.dart';
import 'home/tab/main_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const MainPage(),
        ),
        (route) => false,
      ),
    );
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImage.logo,
          width: 150,
        ),
      ),
    );
  }
}
