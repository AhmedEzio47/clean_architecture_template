import 'package:clean_architecture_template/presentation/home/home_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String splash = '/splash';
  static const String home = '/home';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    late Map args;
    _currentRoute = settings.name;
    if (settings.arguments != null) {
      args = settings.arguments as Map;
    }

    switch (_currentRoute) {
      case AppRoutes.initialRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }

  static String? _currentRoute;
}
