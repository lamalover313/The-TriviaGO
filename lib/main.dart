import 'package:firebase_core/firebase_core.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/pages/home_page.dart';
//import 'package:myapp/pages/login_pages/login_page.dart';
import 'package:myapp/pages/categories_page.dart';
import 'package:myapp/pages/pantalla_page/arte_page.dart';
import 'package:myapp/pages/pantalla_page/ciencia_page.dart';
import 'package:myapp/pages/pantalla_page/deporte_page.dart';
import 'package:myapp/pages/pantalla_page/geografia_page.dart';
import 'package:myapp/pages/pantalla_page/historia_page.dart';
//import 'package:myapp/services/auth_streams.dart';  

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
          builder: (context, state) => const CategoriesPage(),//ArtePage(),//AuthStreamWidget(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/categories',  
          builder: (context, state) => const CategoriesPage(),
        ),
        GoRoute(
          path: '/arte',  
          builder: (context, state) => const ArtePage(),
        ),
        GoRoute(
          path: '/ciencia',  
          builder: (context, state) => const CienciaPage(),
        ),
        GoRoute(
          path: '/deporte',  
          builder: (context, state) => const DeportePage(),
        ),
        GoRoute(
          path: '/geografia',  
          builder: (context, state) => const GeografiaPage(),
        ),
        GoRoute(
          path: '/historia',  
          builder: (context, state) => const HistoriaPage(),
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
