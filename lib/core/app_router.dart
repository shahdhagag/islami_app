import 'package:go_router/go_router.dart';

import '../screens/home/home_screen.dart';
import '../screens/intro/introduction_screen.dart';

abstract class AppRouter{
  static const homeScreen="/home";
  static const introScreen ="/";


  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path:AppRouter.introScreen,
        builder: (context, state) =>  IntroScreen(),
      ),
      GoRoute(
        path: AppRouter.homeScreen,
        builder: (context, state) =>  HomeScreen(),
      ),
    ],
  );


}