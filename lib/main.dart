import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:weightmagine/DI/injection.dart';
import 'package:weightmagine/core/theme/themes.dart';
import 'package:weightmagine/core/utils/constants/app_string_constant.dart';
import 'package:weightmagine/services/notification/notification_service.dart';
import 'package:weightmagine/services/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInjection.inject();
  await NotificationService().init(); // Wait for init to complete
  tz.initializeTimeZones();

  // Schedule daily notification after init is complete
  // NotificationService()
  //     .scheduleDailyNotification(const TimeOfDay(hour: 01, minute: 51));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          title: AppStringConstant.appname,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          routerDelegate: router.routerDelegate,
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
          // home: HomePage(),
        );
      },
    );
  }
}
