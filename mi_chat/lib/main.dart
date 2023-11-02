import 'package:flutter/material.dart';
import 'package:mi_chat/config/theme/app_theme.dart';
import 'package:mi_chat/presentation/providers/chat_provider.dart';
import 'package:mi_chat/presentation/screens/chat/chat_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        title: 'Mi chat',
        debugShowCheckedModeBanner: false,
        theme: AppTheme( selectedColor: 1).theme(),
        home: const ChatScreen()
      ),
    );
  }
}