import 'package:auto_route/auto_route.dart';
import 'package:card_pocket/features/card_list/view/card_list_screen.dart';
import 'package:card_pocket/features/add_card/view/add_card_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: CardListRoute.page, initial: true),
    AutoRoute(page: AddCardRoute.page),
  ];
}