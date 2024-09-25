import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_router.dart';

void main() {
  runApp(BreakingBadApp(
    appRoute: AppRoute(),
  ));
}

class BreakingBadApp extends StatelessWidget {
  const BreakingBadApp({super.key, required this.appRoute});

  final AppRoute appRoute;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRoute.generateRoute,
        );
      },
    );
  }
}
