import 'package:flutter/material.dart';
import 'package:card_pocket/theme/theme.dart';
import 'package:card_pocket/router/router.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CardPocket extends StatefulWidget {
  const CardPocket({super.key});

  @override
  State<CardPocket> createState() => _CardPocketState();
}

class _CardPocketState extends State<CardPocket> {

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Card Pocket',
      theme: AppTheme.lightTheme,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [
          TalkerRouteObserver(GetIt.I<Talker>()),
        ],
      ),
    );
  }
}