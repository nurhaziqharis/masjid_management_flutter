import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../controller/get_current_user.dart';
import '../main.dart';
import '../models/user.dart';
import '../pages/dashboard_admin.dart';
import '../pages/signup.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginPage()),
    GoRoute(path: '/register', builder: (context, state) => const SignupPage()),
    GoRoute(
      path: '/dashboardadmin',
      // builder: (context, state) => const DashboardPage(),
      builder: (context, state){
        final userId = state.uri.queryParameters['userId'];
        return FutureBuilder<User>(
          future: getCurrentUser(userId!),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                )
              );
            }

            if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error, size: 64, color: Colors.red),
                      const SizedBox(height: 16),
                      Text('Error: ${snapshot.error}'),
                      ElevatedButton(
                        onPressed: () => context.go('/'),
                        child: const Text('Go to Login'),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (!snapshot.hasData) {
              return const Scaffold(
                body: Center(
                  child: Text('No user data found'),
                ),
              );
            }

            return DashboardPage(user: snapshot.data!);
          },
        );
      }
    ),
  ],
);