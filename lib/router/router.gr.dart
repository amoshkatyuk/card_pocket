// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddCardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddCardScreen(),
      );
    },
    CardListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CardListScreen(),
      );
    },
  };
}

/// generated route for
/// [AddCardScreen]
class AddCardRoute extends PageRouteInfo<void> {
  const AddCardRoute({List<PageRouteInfo>? children})
      : super(
          AddCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CardListScreen]
class CardListRoute extends PageRouteInfo<void> {
  const CardListRoute({List<PageRouteInfo>? children})
      : super(
          CardListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CardListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
