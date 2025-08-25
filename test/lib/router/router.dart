import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../features/entrepreneur/presentation/screens/home_screen.dart';
import '../../features/entrepreneur/presentation/screens/input_screen.dart';
import '../../features/entrepreneur/presentation/screens/result_screen.dart';
import '../../features/entrepreneur/presentation/screens/sendEmail_screen.dart';
import 'package:collection/collection.dart';
import 'package:ie_checker/core/network/api/models/entrepreneur.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: InputRoute.page),
    AutoRoute(page: ResultRoute.page),
    AutoRoute(page: SendEmailRoute.page),
  ];
}