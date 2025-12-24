import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/app_router.dart';
import 'package:islami/core/app_theme.dart';
import 'package:islami/screens/home/home_screen.dart';

import 'core/cache_helper.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      title: 'islami App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(),
      ),
      themeMode:ThemeMode.dark ,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
