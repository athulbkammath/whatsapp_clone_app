import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_app/provider/home_provider.dart';
import 'screen/home_screen/home_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp UI Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: ChangeNotifierProvider(
          create: (_) => HomeProvider(), child: const HomeScreen()),
    );
  }
}
