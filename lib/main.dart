import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weightmagine/core/theme/themes.dart';
import 'package:weightmagine/core/utils/constants/app_string_constant.dart';
import 'package:weightmagine/src/views/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: AppStringConstant.appname,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          home: HomePage(),
        );
      },
    );
  }
}
