import 'package:go_router/go_router.dart';
import 'package:masjid_management_flutter/views/auth/login_page.dart';

class AppRouter {
  // Route paths constants
  static const String login = '/';
  static const String register = '/register';
  static const String dashboardAdmin = '/dashboardadmin';

  // GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: login,
    routes: [
      GoRoute(
        path: login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      // GoRoute(
      //   path: register,
      //   name: 'register',
      //   builder: (context, state) => const SignupPage(),
      // ),
      // GoRoute(
      //   path: dashboardAdmin,
      //   name: 'dashboard-admin',
      //   builder: (context, state) => const DashboardPage(),
      // ),
      // Add more routes here as needed
    ],
  );

  // Helper methods for navigation
  static void goToLogin(context) => context.go(login);
  static void goToRegister(context) => context.go(register);
  static void goToDashboardAdmin(context) => context.go(dashboardAdmin);


}
