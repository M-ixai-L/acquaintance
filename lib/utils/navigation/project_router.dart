import 'package:acquaintance/screens/home/home_screen.dart';
import 'package:acquaintance/screens/registration/registration_screen.dart';
import 'package:flutter/material.dart';


const  _registration = '/registration';
const  _home = '/home';

class ProjectRouter {
  static final RouteObserver<PageRoute> routeObserver =
  RouteObserver<PageRoute>();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _registration:
        return _buildRoute(settings, RegistrationScreen());
      case _home:
        return _buildRoute(settings,HomeScreen());

    }
    return null;
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget screen) {
    return MaterialPageRoute(settings: settings, builder: (_) => screen);
  }
}

enum Routes {
  registration,
  home,
}

extension RoutNames on Routes {
  String get path {
    switch (this) {
      case Routes.registration:
        return _registration;
      case Routes.home:
        return _home;

    }
  }
}
