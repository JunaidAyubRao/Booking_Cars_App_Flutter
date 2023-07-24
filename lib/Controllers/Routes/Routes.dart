import 'package:booking_car_app_flutter/Models/InsertVihicleData.dart';
import 'package:booking_car_app_flutter/Views/AddVihiclePage.dart';
import 'package:booking_car_app_flutter/Views/BookingPage.dart';
import 'package:booking_car_app_flutter/Views/FavouritePage.dart';
import 'package:booking_car_app_flutter/Views/GetStartedPage.dart';
import 'package:booking_car_app_flutter/Views/HomeVihiclePage.dart';
import 'package:booking_car_app_flutter/Views/Orders_Screen.dart';
import 'package:booking_car_app_flutter/Views/SignInPage.dart';
import 'package:booking_car_app_flutter/Views/SignUpPage.dart';
import 'package:booking_car_app_flutter/Views/SplashScreen.dart';

import 'package:flutter/material.dart';

Route onGenerateRout(RouteSettings settings) {
  if (settings.name == SplashScreen.pageName) {
    return MaterialPageRoute(
      builder: (context) => const SplashScreen(),
    );
  } else if (settings.name == StartingPage.pageName) {
    return MaterialPageRoute(
      builder: (context) => const StartingPage(),
    );
  } else if (settings.name == LoginPage.pageName) {
    return createCustomeRouteLoginPage();
  } else if (settings.name == SignUpPage.pageName) {
    return createCustomeRouteSignUp();
  } else if (settings.name == HomeVihiclePage.pageName) {
    return createCustomeRouteLHomeVihiclePage();
  } else if (settings.name == FavouritePage.pageName) {
    return createCustomeRouteLFavouritePage();
  } else if (settings.name == AddVihiclePage.pageName) {
    return createAddVihiclePageRoute();
  } else if (settings.name == BookingCarPage.pageName) {
    return createeRouteAddVihiclePage(settings);
  } else {
    return MaterialPageRoute(builder: (context) => OrdersCarPage());
  }
}

Route createCustomeRouteSignUp() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SignUpPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: const Offset(1, 1), end: Offset.zero)
            .chain(CurveTween(curve: Curves.ease));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 1000),
      reverseTransitionDuration: const Duration(milliseconds: 1000));
}

Route createCustomeRouteLoginPage() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const LoginPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: const Offset(-1, -1), end: Offset.zero)
            .chain(CurveTween(curve: Curves.ease));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 1000),
      reverseTransitionDuration: const Duration(milliseconds: 1000));
}

Route createCustomeRouteLHomeVihiclePage() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const HomeVihiclePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: const Offset(-1, 0), end: Offset.zero)
            .chain(CurveTween(curve: Curves.ease));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 1000),
      reverseTransitionDuration: const Duration(milliseconds: 1000));
}

Route createCustomeRouteLFavouritePage() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const FavouritePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: const Offset(-1, 1), end: Offset.zero)
            .chain(CurveTween(curve: Curves.ease));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 1000),
      reverseTransitionDuration: const Duration(milliseconds: 1000));
}

Route createAddVihiclePageRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => AddVihiclePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: const Offset(1, 0), end: Offset.zero)
            .chain(CurveTween(curve: Curves.ease));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 1000),
      reverseTransitionDuration: const Duration(milliseconds: 1000));
}

Route createeRouteAddVihiclePage(RouteSettings routeSettings) {
  return PageRouteBuilder(
      settings: RouteSettings(arguments: routeSettings),
      pageBuilder: (context, animation, secondaryAnimation) => BookingCarPage(
            vihicles: routeSettings.arguments as InsertDataVihicles,
          ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: const Offset(0, 1), end: Offset.zero)
            .chain(CurveTween(curve: Curves.ease));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 1000),
      reverseTransitionDuration: const Duration(milliseconds: 1000));
}
