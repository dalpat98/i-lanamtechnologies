import 'package:deliveryapp/views/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool first = true;

  void gotohome() async {
    await Future.delayed(const Duration(seconds: 2)).then(
      (value) => {
        Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => const HomeScreen(),
          ),
          (route) => false,
        )
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (first) {
      first = false;
      gotohome();
    }
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOUK-2QzEs_C0eZ6sY-vq2wVkFXzP06vyu9w&usqp=CAU',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
