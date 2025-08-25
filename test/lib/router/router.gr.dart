// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [InputScreen]
class InputRoute extends PageRouteInfo<void> {
  const InputRoute({List<PageRouteInfo>? children})
    : super(InputRoute.name, initialChildren: children);

  static const String name = 'InputRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const InputScreen();
    },
  );
}

/// generated route for
/// [ResultScreen]
class ResultRoute extends PageRouteInfo<ResultRouteArgs> {
  ResultRoute({
    Key? key,
    required Entrepreneur entrepreneur,
    required Map<String, dynamic> openData,
    required String ern,
    List<PageRouteInfo>? children,
  }) : super(
         ResultRoute.name,
         args: ResultRouteArgs(
           key: key,
           entrepreneur: entrepreneur,
           openData: openData,
           ern: ern,
         ),
         initialChildren: children,
       );

  static const String name = 'ResultRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResultRouteArgs>();
      return ResultScreen(
        key: args.key,
        entrepreneur: args.entrepreneur,
        openData: args.openData,
        ern: args.ern,
      );
    },
  );
}

class ResultRouteArgs {
  const ResultRouteArgs({
    this.key,
    required this.entrepreneur,
    required this.openData,
    required this.ern,
  });

  final Key? key;

  final Entrepreneur entrepreneur;

  final Map<String, dynamic> openData;

  final String ern;

  @override
  String toString() {
    return 'ResultRouteArgs{key: $key, entrepreneur: $entrepreneur, openData: $openData, ern: $ern}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResultRouteArgs) return false;
    return key == other.key &&
        entrepreneur == other.entrepreneur &&
        const MapEquality().equals(openData, other.openData) &&
        ern == other.ern;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      entrepreneur.hashCode ^
      const MapEquality().hash(openData) ^
      ern.hashCode;
}

/// generated route for
/// [SendEmailScreen]
class SendEmailRoute extends PageRouteInfo<SendEmailRouteArgs> {
  SendEmailRoute({Key? key, required String ern, List<PageRouteInfo>? children})
    : super(
        SendEmailRoute.name,
        args: SendEmailRouteArgs(key: key, ern: ern),
        initialChildren: children,
      );

  static const String name = 'SendEmailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SendEmailRouteArgs>();
      return SendEmailScreen(key: args.key, ern: args.ern);
    },
  );
}

class SendEmailRouteArgs {
  const SendEmailRouteArgs({this.key, required this.ern});

  final Key? key;

  final String ern;

  @override
  String toString() {
    return 'SendEmailRouteArgs{key: $key, ern: $ern}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SendEmailRouteArgs) return false;
    return key == other.key && ern == other.ern;
  }

  @override
  int get hashCode => key.hashCode ^ ern.hashCode;
}
