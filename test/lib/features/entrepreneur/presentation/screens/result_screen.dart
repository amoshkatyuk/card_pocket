import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api/models/entrepreneur.dart';
import '../../../../router/router.dart';
import 'home_screen.dart';
import 'sendEmail_screen.dart';

@RoutePage()
class ResultScreen extends StatelessWidget {
  final Entrepreneur entrepreneur;
  final Map<String, dynamic> openData;
  final String ern;

  const ResultScreen({
    super.key,
    required this.entrepreneur,
    required this.openData,
    required this.ern,
  });

  @override
  Widget build(BuildContext context) {
    // Получение данных для первого блока
    final actionList = openData['action'] as List<dynamic>?;
    final firstAction = actionList != null && actionList.isNotEmpty ? actionList[0] : null;
    final payState = firstAction?.PayState ?? 'Нет данных';
    final contragents = firstAction?.AviableContragents ?? 'Нет данных';
    final payments = firstAction?.AviablePayments ?? 'Нет данных';

    // Получение данных для ФИО
    final general = openData['general'];
    final surname = general?.surname ?? 'Нет данных';
    final name = general?.name ?? 'Нет данных';
    final patronymic = general?.patronymic ?? 'Нет данных';

    // Получение данных для выпадающего списка
    final nameOfActivity = openData['nameofactivity'] as List<dynamic>?;
    final firstnameOfActivity = nameOfActivity != null && nameOfActivity.isNotEmpty ? nameOfActivity[0] : null;
    final account = firstnameOfActivity?.Account ?? 'Нет данных';
    final nameOfActivities = firstnameOfActivity?.NameOfActivities ?? 'Нет данных';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Результат'),
        backgroundColor: const Color(0xFF324DAF),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Блок ФИО и оплаты
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 110,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow('Состояние оплаты', payState,
                          highlightColor: payState == 'ОПЛАЧЕНО' ? Colors.green : Colors.red),
                      const SizedBox(height: 12),
                      _buildInfoRow('Возможные контрагенты', contragents),
                      const SizedBox(height: 12),
                      _buildInfoRow('Возможность расчетов', payments),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                _buildAdditionalInfoRow('Фамилия:', surname),
                _buildAdditionalInfoRow('Имя:', name),
                _buildAdditionalInfoRow('Отчество:', patronymic),
              ],
            ),
            const SizedBox(height: 32),
            ExpansionTile(
              collapsedBackgroundColor: Colors.grey.shade300,
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Text(
                'Патентная система налогообложения',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                Column(
                  children: [
                    _buildAdditionalInfoRow('Состояние оплаты:', payState),
                    _buildAdditionalInfoRow('Лицевой счет:', account),
                    _buildAdditionalInfoRow('Вид деятельности:', nameOfActivities),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.router.replaceAll([const HomeRoute()]);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: const Text('На главную', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.router.push(SendEmailRoute(ern: ern));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF324DAF),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: const Text('Сохранить',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, {Color? highlightColor}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(flex: 2, child: Text(title, style: const TextStyle(fontSize: 16))),
        const SizedBox(width: 8),
        Flexible(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
              color: highlightColor ?? Colors.transparent,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              value,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: highlightColor != null ? Colors.white : Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAdditionalInfoRow(String title, String value) {
    return Row(
      children: [
        SizedBox(width: 110, child: Text(title, textAlign: TextAlign.right)),
        const SizedBox(width: 8),
        Expanded(child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold))),
      ],
    );
  }
}
