import 'package:card_pocket/card_pocket_app.dart';
import 'package:card_pocket/repositories/card_pocket/abstract_card_repository.dart';
import 'package:card_pocket/repositories/card_pocket/card_repository.dart';
import 'package:card_pocket/repositories/card_pocket/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton<Talker>(talker);

  GetIt.I.registerSingleton<AbstractCardRepository>(CardRepository());

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printStateFullData: false,
      printEventFullData: false,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(CardModelAdapter());



  runApp(const CardPocket());
}








