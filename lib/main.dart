import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:myapp/pages/login_pages/login_page.dart';
import 'package:myapp/pages/home_page/home_page.dart';

import 'package:myapp/pages/trivia_page/TriviaGO_zero.dart';
import 'package:myapp/pages/categories_page/categories_page.dart';

import 'package:myapp/pages/results_page/results_page.dart';
import 'package:myapp/pages/leaderboard_page/leaderboard_page.dart';

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
            path: '/trivia',
            builder: (context, state) {
              final data = state.extra as Map<String, dynamic>;
              return TriviaPage(
                title: data['category'] as String,
                location: '/categoria',
                baseColor1: data['color1'] as Color,
                baseColor2: data['color2'] as Color,
                isRandom: false,
                apiUrl: data['apiUrl'] as String,
                category: data['category'] as String,
                difficulty: data['difficulty'] as String,
              );
            },
          ),
          GoRoute(
            path: '/trivia-random',
            builder: (context, state) => const TriviaPage(
              title: 'TriviaGO - Random',
              location: '/home',
              baseColor1: Color.fromARGB(235, 93, 28, 207),
              baseColor2: Color.fromARGB(255, 0, 31, 207),
              isRandom: true,
            ),
          ),
          GoRoute(
            path: '/resultado',
            builder: (context, state) => const ResultsPage(),
          ),
          GoRoute(
            path: '/leaderboard',
            builder: (context, state) => const LeaderboardPage(),
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