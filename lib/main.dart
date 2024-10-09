import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weightmagine/DI/injection.dart';
import 'package:weightmagine/core/theme/themes.dart';
import 'package:weightmagine/core/utils/constants/app_string_constant.dart';
import 'package:weightmagine/services/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
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
