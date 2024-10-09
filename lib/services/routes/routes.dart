import 'package:go_router/go_router.dart';
import 'package:weightmagine/core/utils/helpers.dart';
import 'package:weightmagine/services/routes/route_name.dart';
import 'package:weightmagine/services/routes/route_path.dart';
import 'package:weightmagine/src/views/home_page.dart';
import 'package:weightmagine/src/views/onboarding_screen.dart';

final router = GoRouter(
    redirect: (context, state) async {
      bool? haveFilled = await Helpers.getUser(key: 'haveFilledName');
      if (haveFilled == true && state.uri.toString() == RoutePaths.onboarding) {
        return RoutePaths.home;
      } else if (haveFilled == false &&
          state.uri.toString() != RoutePaths.onboarding) {
        return RoutePaths.onboarding;
      }

      return null;
    },
    initialLocation: RoutePaths.onboarding,
    routes: [
      GoRoute(
        name: RouteNames.onborading,
        path: RoutePaths.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        name: RouteNames.home,
        path: RoutePaths.home,
        builder: (context, state) => const HomePage(),
      ),
    ]);
