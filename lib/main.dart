import 'package:flutter/material.dart';
import 'package:dialogue/chat_view.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'constants/gemini_api_key.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  Gemini.init(apiKey: geminiAPIKey);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    splashInitialization();
  }

  void splashInitialization() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialogue',
      debugShowCheckedModeBanner: false,
      home: const ChatView(),
    );
  }
}
