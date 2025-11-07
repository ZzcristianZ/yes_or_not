import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_or_no/presentation/providers/chat_provider.dart';
import 'package:yes_or_no/presentation/screens/chat/chat_Screen.dart';
import 'config/theme/app_theme.dart';
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
        title: 'Chat ',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 3 ).theme(),
        home: const ChatScreen()
      ),
    );
  }
}