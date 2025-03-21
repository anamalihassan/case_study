import 'package:flutter/material.dart';

import '../features/menu/presentation/screens/main_menu_screen.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case AppRoutes.splashScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const SplashView(),
      //   );
      case AppRoutes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => const MainMenuScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
