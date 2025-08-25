import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../router/router.dart';
import '../screens/input_screen.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Сведения об ИП")),
        backgroundColor: const Color(0xFF324DAF),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              color: const Color(0xFF324DAF),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildSquareButton(
                        context,
                        icon: Icons.input,
                        label: "Ввести данные",
                        onTap: () {
                          context.router.push(const InputRoute());
                        },
                      ),
                      _buildSquareButton(
                        context,
                        icon: Icons.block,
                        label: "Заглушка",
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Кнопка временно не работает'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSquareButton(
      BuildContext context, {
        required IconData icon,
        required String label,
        required VoidCallback onTap,
      }) {
    return SizedBox(
      width: 170,
      height: 160,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white.withOpacity(0.9),
          foregroundColor: Colors.black,
          elevation: 5,
        ),
        onPressed: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            const SizedBox(height: 10),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
