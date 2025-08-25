import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../service_locator.dart';
import '../cubit/email_cubit.dart';

@RoutePage()
class SendEmailScreen extends StatelessWidget {
  final String ern;
  const SendEmailScreen({super.key, required this.ern});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<EmailCubit>(),
      child: SendEmailView(ern: ern),
    );
  }
}

class SendEmailView extends StatefulWidget {
  final String ern;
  const SendEmailView({super.key, required this.ern});

  @override
  State<SendEmailView> createState() => _SendEmailViewState();
}

class _SendEmailViewState extends State<SendEmailView> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _sendEmail(BuildContext context) {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Введите email')));
      return;
    }
    context.read<EmailCubit>().sendEmail(ern: widget.ern, email: email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Отправка Email'),
        backgroundColor: const Color(0xFF324DAF),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Данные проверки будут отправлены на указанный email',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 32),
                        const Text('Email', style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              BlocConsumer<EmailCubit, EmailState>(
                listener: (context, state) {
                  if (state.success) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Email успешно отправлен!')));
                    context.router.pop();
                  } else if (state.errorMessage != null) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Ошибка: ${state.errorMessage}')));
                  }
                },
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: state.isSending ? null : () => _sendEmail(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF324DAF),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: state.isSending
                          ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                      )
                          : const Text('Отправить', style: TextStyle(color: Colors.white)),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
