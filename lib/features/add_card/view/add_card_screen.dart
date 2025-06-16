import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:card_pocket/features/add_card/bloc/add_card_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:auto_route/auto_route.dart';
import 'package:card_pocket/repositories/card_pocket/abstract_card_repository.dart';

@RoutePage()
class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _cardHolderController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();

  late final AddCardBloc _addCardBloc;

  @override
  void initState() {
    super.initState();
    _addCardBloc = AddCardBloc(GetIt.I<AbstractCardRepository>());
  }

  @override
  void dispose() {
    _addCardBloc.close();
    _cardHolderController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    super.dispose();
  }

  void _scanCard() {
    _addCardBloc.add(ScanCardRequested());
  }

  void _saveCard() {
    _addCardBloc.add(
      SaveCardRequested(
        cardHolder: _cardHolderController.text,
        cardNumber: _cardNumberController.text,
        expiryDate: _expiryDateController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить карту'),
      ),
      body: BlocConsumer<AddCardBloc, AddCardState>(
        bloc: _addCardBloc,
        listener: (context, state) {
          if (state is AddCardScanned) {
            _cardHolderController.text = state.cardHolder;
            _cardNumberController.text = state.cardNumber;
            _expiryDateController.text = state.expiryDate;
          }

          if (state is AddCardSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Карта успешно добавлена')),
            );
            AutoRouter.of(context).pop(true);
          }

          if (state is AddCardFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Ошибка: ${state.exception}')),
            );
          }
        },
        builder: (context, state) {
          final isLoading =
              state is AddCardScanning || state is AddCardSaving;

          return Stack(
            children: [
              AbsorbPointer(
                absorbing: isLoading,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: _scanCard,
                        child: const Text('Сканировать карту'),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _cardHolderController,
                        decoration: const InputDecoration(
                          labelText: 'Имя владельца',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _cardNumberController,
                        decoration: const InputDecoration(
                          labelText: 'Номер карты',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _expiryDateController,
                        decoration: const InputDecoration(
                          labelText: 'Срок действия (MM/YY)',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _saveCard,
                          child: const Text('Сохранить'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (isLoading)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }
}