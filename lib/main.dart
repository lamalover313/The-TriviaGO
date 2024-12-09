import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
//import 'package:myapp/pages/login_pages/login_page.dart';
import 'package:myapp/pages/categories_page/categories_page.dart';
import 'package:myapp/pages/home_page/home_page.dart';
import 'package:myapp/pages/login_pages/login_page.dart';
import 'package:myapp/pages/pantalla_page/pantalla_page.dart';
import 'package:myapp/pages/results_page/results_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/categoria',
        builder: (context, state) => const CategoriesPage(),
      ),
      GoRoute(
        path: '/pantalla',
        builder: (context, state) {
          final params = state.extra as Map<String, dynamic>;
          return PantallaPage(params: params);
        },
      ),
      GoRoute(
        path: '/resultado',
        builder: (context, state) => const ResultsPage(),
      ),
      GoRoute(
        path: '/pantalla/:category/:difficulty',
        builder: (context, state) {
          final category = state.pathParameters['category'] ?? '';
          final difficulty = state.pathParameters['difficulty'] ?? '';
          return PantallaPage(
            params: {
              'category': category,
              'difficulty': difficulty,
            },
          );
        },
      ),
    ],
  );

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
