import 'package:auto_route/auto_route.dart';
import 'package:card_pocket/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:card_pocket/features/card_list/bloc/card_list_bloc.dart';
import 'package:card_pocket/features/card_list/widgets/card_tile.dart';
import 'package:card_pocket/repositories/card_pocket/abstract_card_repository.dart';

@RoutePage()
class CardListScreen extends StatefulWidget {
  const CardListScreen({super.key});

  @override
  State<CardListScreen> createState() => _CardListScreenState();
}

class _CardListScreenState extends State<CardListScreen> {
  late final CardListBloc _cardListBloc;

  @override
  void initState() {
    super.initState();
    _cardListBloc = CardListBloc(GetIt.I<AbstractCardRepository>());
    _cardListBloc.add(LoadCardList());
  }

  @override
  void dispose() {
    _cardListBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои карты'),
      ),
      body: BlocBuilder<CardListBloc, CardListState>(
        bloc: _cardListBloc,
        builder: (context, state) {
          if (state is CardListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CardListLoaded) {
            final cards = state.cards;
            if (cards.isEmpty) {
              return const Center(child: Text('Нет сохранённых карт.'));
            }
            return ListView.separated(
              itemCount: cards.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final card = cards[index];
                return Dismissible(
                    key: ValueKey(card.id),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (_) {
                      _cardListBloc.add(DeleteCard(card.id));
                    },
                    child: CardTile(card: card),
                );
              },
            );
          } else if (state is CardListFailure) {
            return Center(child: Text('Ошибка: ${state.exception}'));
          }
          return const SizedBox.shrink();
        },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await AutoRouter.of(context).push(AddCardRoute());
          if (result == true) {
            _cardListBloc.add(LoadCardList());
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


