import 'package:firebase_core/firebase_core.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/pages/login_pages/login_page.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/categories_page.dart';  // Importar CategoriesPage

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
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/categories',  // Ruta agregada para CategoriesPage
          builder: (context, state) => const CategoriesPage(),
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
