import 'package:flutter/material.dart';
import 'config/app_theme.dart';
import 'navigation/main_navigation.dart';

/// Punto de entrada de la aplicación
/// Configura el tema y la navegación principal
void main() {
  runApp(const StudentInfoApp());
}

/// Widget raíz de la aplicación
class StudentInfoApp extends StatelessWidget {
  const StudentInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Información Estudiantil',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainNavigation(),
    );
  }
}
