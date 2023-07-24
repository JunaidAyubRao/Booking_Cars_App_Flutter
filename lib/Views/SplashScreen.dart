import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const pageName = '/SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, SplashScreen.pageName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      body: Container(
        color: Colors.white.withOpacity(0.1),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.35,
            ),
            Image.asset('assets/images/bookingsplash_image.gif'),
            SizedBox(
                width: width * 0.5,
                height: height * 0.03,
                child: const FittedBox(child: Text('CAS "N" GO')))
          ],
        ),
      ),
    );
  }
}
