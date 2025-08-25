import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ie_checker/core/network/api.dart';
import 'package:ie_checker/features/entrepreneur/presentation/screens/home_screen.dart';
import 'package:ie_checker/router/router.dart';
import 'package:ie_checker/service_locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
      title: 'IE Checker',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF324DAF)),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
