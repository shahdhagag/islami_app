import 'package:go_router/go_router.dart';
import 'package:islami/core/cache_helper.dart';
import 'package:islami/model/hadeeth.dart';

import '../model/hadeeth_details_args.dart';
import '../screens/home/home_screen.dart';
import '../screens/home/tabs/hadeth/details/hadeeth_details_screen.dart';
import '../screens/home/tabs/quran/details/sura_details_screen.dart';
import '../screens/home/tabs/quran/details/sura_details_screen1.dart';
import '../screens/intro/introduction_screen.dart';

abstract class AppRouter{
  static const homeScreen="/home";
  static const introScreen ="/";
  static const detailsScreen ="/detailsScreen";
  static const detailsScreen1 ="/detailsScreen1";
  static const hadeethDetailsScreen ="/hadeethdeatils";




  static final GoRouter router = GoRouter(
    redirect: (context, state) {
      final bool seenOnboarding =
          CacheHelper.getBool("seenOnboarding") ?? false;

      final bool isOnIntro = state.matchedLocation == introScreen;

      // If onboarding NOT seen → force intro
      if (!seenOnboarding && !isOnIntro) {
        return introScreen;
      }

      // If onboarding seen → skip intro
      if (seenOnboarding && isOnIntro) {
        return homeScreen;
      }

      return null; // no redirect
    },

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
        path: AppRouter.detailsScreen1,
        builder: (context, state) {
          final int index= state.extra as int;
         return SuraDetailsScreen1(
            index: index,
          );
        }
      ),
      GoRoute(
          path: AppRouter.detailsScreen,
          builder: (context, state) {
            final int index= state.extra as int;
            return SuraDetailsScreen(
              index: index,
            );
          }
      ),
      GoRoute(
        path: AppRouter.hadeethDetailsScreen,
        builder: (context, state) {
          final args = state.extra as HadeethDetailsArgs;

          return HadethDetailsScreen(
            hadeeth: args.hadeeth,
            index: args.index,
          );
        },
      ),



    ],
  );


}