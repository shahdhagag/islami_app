import 'package:go_router/go_router.dart';

import '../screens/home/home_screen.dart';
import '../screens/home/tabs/quran/details/sura_details_screen.dart';
import '../screens/intro/introduction_screen.dart';

abstract class AppRouter{
  static const homeScreen="/home";
  static const introScreen ="/";
  static const detailsScreen ="/detailsScreen";


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
      GoRoute(
        path: AppRouter.detailsScreen,
        builder: (context, state) {
          final int index= state.extra as int;
         return SuraDetailsScreen1(
            index: index,
          );
        }
      ),

    ],
  );


}