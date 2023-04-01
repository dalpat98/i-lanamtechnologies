import 'package:deliveryapp/controller/home_screen_provider.dart';
import 'package:deliveryapp/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.black,
        title: "Delivery App",
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashScreen(),
        },
      ),
    );
  }
}
