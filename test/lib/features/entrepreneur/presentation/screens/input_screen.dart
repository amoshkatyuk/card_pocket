import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../router/router.dart';
import '../../../../service_locator.dart';
import '../cubit/entrepreneur_cubit.dart';
import 'result_screen.dart';

@RoutePage()
class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<EntrepreneurCubit>(),
      child: const InputScreenView(),
    );
  }
}

class InputScreenView extends StatefulWidget {
  const InputScreenView({super.key});

  @override
  State<InputScreenView> createState() => _InputScreenViewState();
}

class _InputScreenViewState extends State<InputScreenView> {
  final _formKey = GlobalKey<FormState>();
  final _surnameController = TextEditingController();
  final _nameController = TextEditingController();
  final _patronymicController = TextEditingController();
  final _birthdateController = TextEditingController();

  EntrepreneurCubit get cubit => context.read<EntrepreneurCubit>();

  @override
  void dispose() {
    _surnameController.dispose();
    _nameController.dispose();
    _patronymicController.dispose();
    _birthdateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      _birthdateController.text =
      "${picked.day.toString().padLeft(2, '0')}.${picked.month.toString().padLeft(2, '0')}.${picked.year}";
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      cubit.fetchEntrepreneur(
        surname: _surnameController.text,
        name: _nameController.text,
        patronymic: _patronymicController.text,
        birthdate: _birthdateController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ввод данных предпринимателя'),
        backgroundColor: const Color(0xFF324DAF),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocListener<EntrepreneurCubit, EntrepreneurState>(
          listener: (context, state) {
            if (state.entrepreneur != null && state.openData != null) {
              context.router.push(ResultRoute(
                entrepreneur: state.entrepreneur!,
                openData: state.openData!,
                ern: state.ern!,
              ));
              cubit.reset();
            }
            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Ошибка: ${state.errorMessage}')),
              );
            }
          },
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTextFormDescription(text: 'Фамилия'),
                  _buildInputField(
                    controller: _surnameController,
                    hint: 'Введите фамилию',
                    validator: (v) => v!.isEmpty ? 'Введите фамилию' : null,
                  ),
                  const SizedBox(height: 20),
                  _buildTextFormDescription(text: 'Имя'),
                  _buildInputField(
                    controller: _nameController,
                    hint: 'Введите имя',
                    validator: (v) => v!.isEmpty ? 'Введите имя' : null,
                  ),
                  const SizedBox(height: 20),
                  _buildTextFormDescription(text: 'Отчество'),
                  _buildInputField(
                    controller: _patronymicController,
                    hint: 'Введите отчество',
                    validator: (v) => v!.isEmpty ? 'Введите отчество' : null,
                  ),
                  const SizedBox(height: 20),
                  _buildTextFormDescription(text: 'Дата рождения'),
                  _buildInputField(
                    controller: _birthdateController,
                    hint: 'Введите дату рождения',
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    validator: (v) => v!.isEmpty ? 'Введите дату рождения' : null,
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0A2588),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text('Отправить'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<EntrepreneurCubit, EntrepreneurState>(
                    builder: (context, state) {
                      return state.isLoading
                          ? const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Center(child: CircularProgressIndicator()),
                      )
                          : const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hint,
    required String? Function(String?) validator,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      validator: validator,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  Widget _buildTextFormDescription({required String text}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
