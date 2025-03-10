import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/theme_provider.dart';
import 'package:todo_app/screen/homepage.dart';
import 'package:todo_app/theme/dark_theme.dart';
import 'package:todo_app/theme/light_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        final provider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          themeMode: provider.themeState,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: Homepage(),
        );
      },
    );
  }
}
