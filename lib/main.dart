import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tech_nest/pages/dashboard.dart';
import 'package:tech_nest/pages/login.dart';
import 'package:tech_nest/pages/onBoaring.dart';
import 'package:tech_nest/pages/profile.dart';
import 'package:tech_nest/providers/bottomNavProvider.dart';
import 'package:tech_nest/providers/homeProvider.dart';
import 'package:tech_nest/providers/loginProvider.dart';
import 'package:tech_nest/providers/onBoardingProvider.dart';
import 'package:tech_nest/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnBoardingProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: GetMaterialApp(
        title: 'TechNest',
        // themeMode: ThemeMode.dark,
        // theme: ThemeData(),
        // darkTheme: darkTheme(),
        // * Routes
        initialRoute: '/dashboardScreen',
        routes: {
          '/onBoardingScreen': (context) => const OnBoardingScreen(),
          '/loginScreen': (context) => const LoginScreen(),
          '/dashboardScreen': (context) => const DashBoardNav(),
          '/profileScreen': (context) => const ProfileScreen(),
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: primaryColor,
        ),
        child: Center(child: Image.asset('assets/images/logo.png')
            // Text(
            //   "Tech Nest",
            //   style: headLine1(),
            // ),
            ),
      ),
    );
  }
}
