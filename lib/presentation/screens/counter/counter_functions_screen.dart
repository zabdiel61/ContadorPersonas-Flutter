import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: const Text(
            'Asistencia a las reuniones',
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Contador de personas',
                style: TextStyle(fontSize: 30),
              ),
              Text('$clickCounter',
                  style: const TextStyle(
                      fontSize: 160,
                      fontWeight: FontWeight.w200,
                      color: Colors.red)),
              Text('Asistente${clickCounter == 1 ? '' : 's'}',
                  style: const TextStyle(fontSize: 30))
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtom(
              icon: Icons.refresh_rounded,
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButtom(
              icon: Icons.exposure_minus_1,
              onPressed: () {
                setState(() {
                  if (clickCounter == 0) return;
                  clickCounter--;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButtom(
              icon: Icons.plus_one,
              onPressed: () {
                setState(() {
                  clickCounter++;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButtom(
              icon: Icons.share_rounded,
              onPressed: () {
                Share.share('la asitencia a la reunion fue de $clickCounter');
              },
            )
          ],
        ));
  }
}

class CustomButtom extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const CustomButtom({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // shape: const StadiumBorder(),
      enableFeedback: true,
      elevation: 5,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
