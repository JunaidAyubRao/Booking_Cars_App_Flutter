import 'package:booking_car_app_flutter/Controllers/Routes/Routes.dart';
import 'package:booking_car_app_flutter/Views/AddVihiclePage.dart';
import 'package:booking_car_app_flutter/Views/BookingPage.dart';
import 'package:booking_car_app_flutter/Views/HomeVihiclePage.dart';
import 'package:booking_car_app_flutter/Views/Orders_Screen.dart';
import 'package:booking_car_app_flutter/Views/SplashScreen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreen.pageName,
      onGenerateRoute: onGenerateRout,
    );
  }
}
