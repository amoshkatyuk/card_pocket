import 'package:flutter/material.dart';
import 'package:card_pocket/repositories/card_pocket/models/card_model.dart';

class CardTile extends StatelessWidget {
  const CardTile({
    super.key,
    required this.card,
});

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.credit_card),
      title: Text(_formatCardNumber(card.cardNumber)),
      trailing: Text(card.expiryDate),
    );
  }

  String _formatCardNumber(String number) {
    final buffer = StringBuffer();
    for(int i = 0; i < number.length; i++) {
      buffer.write(number[i]);
      if((i+1) % 4 == 0 && i != number.length - 1) {
        buffer.write(' ');
      }
    }
    return buffer.toString();
  }
}