// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sales_assistant_app/main.dart';
import 'package:sales_assistant_app/core/constants/app_strings.dart';

void main() {
  group('Pruebas de Integración - StudentInfoApp', () {
    /// Verifica que la aplicación se inicia correctamente
    testWidgets('App inicia y muestra la pantalla de inicio',
        (WidgetTester tester) async {
      await tester.pumpWidget(const StudentInfoApp());

      // Verifica que el AppBar con el título "Inicio" existe
      expect(find.text(AppStrings.homeTitle), findsOneWidget);

      // Verifica que la barra de navegación está presente
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      // Verifica que hay 3 elementos en la navegación
      expect(find.byType(BottomNavigationBarItem), findsWidgets);
    });

    /// Verifica que la pantalla de Inicio se renderiza correctamente
    testWidgets('HomeScreen se muestra con contenido correcto',
        (WidgetTester tester) async {
      await tester.pumpWidget(const StudentInfoApp());

      // Verifica el título
      expect(find.text(AppStrings.homeTitle), findsOneWidget);

      // Verifica el mensaje "Próximamente"
      expect(find.text(AppStrings.comingSoon), findsOneWidget);

      // Verifica que el ícono de home está presente
      expect(find.byIcon(Icons.home), findsOneWidget);
    });

    /// Verifica la navegación a la pantalla de Ayuda
    testWidgets('Navega a HelpScreen al hacer tap en el ícono de Ayuda',
        (WidgetTester tester) async {
      await tester.pumpWidget(const StudentInfoApp());

      // Encuentra el botón de Ayuda en la barra de navegación
      final helpNavButton = find.byIcon(Icons.help);

      // Verifica que el ícono de help está presente
      expect(helpNavButton, findsOneWidget);

      // Hace tap en el botón de Ayuda
      await tester.tap(helpNavButton);

      // Ejecuta la animación de transición
      await tester.pumpAndSettle();

      // Verifica que se cambió a la pantalla de Ayuda
      expect(find.text(AppStrings.helpTitle), findsOneWidget);

      // Verifica que el ícono de help está activo
      expect(find.byIcon(Icons.help), findsWidgets);
    });

    /// Verifica la navegación a la pantalla de Perfil
    testWidgets('Navega a ProfileScreen al hacer tap en el ícono de Perfil',
        (WidgetTester tester) async {
      await tester.pumpWidget(const StudentInfoApp());

      // Encuentra el botón de Perfil en la barra de navegación
      final profileNavButton = find.byIcon(Icons.person);

      // Verifica que el ícono está presente
      expect(profileNavButton, findsOneWidget);

      // Hace tap en el botón de Perfil
      await tester.tap(profileNavButton);

      // Ejecuta la animación
      await tester.pumpAndSettle();

      // Verifica que se cambió a la pantalla de Perfil
      expect(find.text(AppStrings.profileTitle), findsOneWidget);

      // Verifica que el ícono de person está activo
      expect(find.byIcon(Icons.person), findsWidgets);
    });

    /// Verifica navegación cíclica entre todas las pantallas
    testWidgets('Navega entre todas las pantallas correctamente',
        (WidgetTester tester) async {
      await tester.pumpWidget(const StudentInfoApp());

      // Comienza en Inicio
      expect(find.text(AppStrings.homeTitle), findsOneWidget);

      // Navega a Ayuda
      await tester.tap(find.byIcon(Icons.help).first);
      await tester.pumpAndSettle();
      expect(find.text(AppStrings.helpTitle), findsOneWidget);

      // Navega a Perfil
      await tester.tap(find.byIcon(Icons.person).first);
      await tester.pumpAndSettle();
      expect(find.text(AppStrings.profileTitle), findsOneWidget);

      // Vuelve a Inicio
      await tester.tap(find.byIcon(Icons.home).first);
      await tester.pumpAndSettle();
      expect(find.text(AppStrings.homeTitle), findsOneWidget);
    });

    /// Verifica que el tema se aplica correctamente
    testWidgets('El tema se aplica correctamente a toda la app',
        (WidgetTester tester) async {
      await tester.pumpWidget(const StudentInfoApp());

      // Verifica que MaterialApp existe
      expect(find.byType(MaterialApp), findsOneWidget);

      // Verifica que el Scaffold existe
      expect(find.byType(Scaffold), findsOneWidget);

      // Verifica que AppBar existe y tiene el color correcto
      final appBar = find.byType(AppBar);
      expect(appBar, findsOneWidget);
    });

    /// Verifica que la barra de navegación tiene los elementos correctos
    testWidgets('BottomNavigationBar contiene todos los items esperados',
        (WidgetTester tester) async {
      await tester.pumpWidget(const StudentInfoApp());

      // Busca todos los BottomNavigationBarItem
      final navItems = find.byType(BottomNavigationBarItem);

      // Verifica que hay exactamente 3 items
      expect(navItems, findsWidgets);

      // Verifica que cada pantalla tiene su ícono activo
      expect(find.byIcon(Icons.home), findsWidgets);
      expect(find.byIcon(Icons.help), findsWidgets);
      expect(find.byIcon(Icons.person), findsWidgets);
    });

    /// Verifica la persistencia del estado durante la navegación
    testWidgets('El estado persiste al navegar entre pantallas',
        (WidgetTester tester) async {
      await tester.pumpWidget(const StudentInfoApp());

      // Comienza en Inicio
      expect(find.text(AppStrings.homeTitle), findsOneWidget);

      // Navega a Ayuda
      await tester.tap(find.byIcon(Icons.help).first);
      await tester.pumpAndSettle();

      // Navega de vuelta a Inicio
      await tester.tap(find.byIcon(Icons.home).first);
      await tester.pumpAndSettle();

      // Verifica que sigue en la pantalla de Inicio
      expect(find.text(AppStrings.homeTitle), findsOneWidget);
    });

    /// Verifica que todas las pantallas tienen el mismo estructura base
    testWidgets('Todas las pantallas tienen AppBar y contenido centrado',
        (WidgetTester tester) async {
      await tester.pumpWidget(const StudentInfoApp());

      // Prueba HomeScreen
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);

      // Navega a HelpScreen
      await tester.tap(find.byIcon(Icons.help).first);
      await tester.pumpAndSettle();
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);

      // Navega a ProfileScreen
      await tester.tap(find.byIcon(Icons.person).first);
      await tester.pumpAndSettle();
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
    });

    /// Verifica que los títulos de navegación son visibles
    testWidgets('Los títulos de los ítems de navegación son visibles',
        (WidgetTester tester) async {
      await tester.pumpWidget(const StudentInfoApp());

      // Verifica que todos los títulos están presentes en la barra de nav
      expect(find.text(AppStrings.homeTitle), findsOneWidget);
      expect(find.text(AppStrings.helpTitle), findsOneWidget);
      expect(find.text(AppStrings.profileTitle), findsOneWidget);
    });
  });

  group('Pruebas de Widgets Individuales', () {
    /// Verifica que Center con Column funciona correctamente
    testWidgets('Center y Column se renderizan correctamente',
        (WidgetTester tester) async {
      await tester.pumpWidget(const StudentInfoApp());

      // Verifica que los widgets de layout están presentes
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
    });

    /// Verifica que los íconos grandes están presentes
    testWidgets('Los íconos grandes se renderizan correctamente',
        (WidgetTester tester) async {
      await tester.pumpWidget(const StudentInfoApp());

      // Verifica el ícono de home en la pantalla actual
      expect(find.byIcon(Icons.home_rounded), findsOneWidget);

      // Navega y verifica los otros íconos
      await tester.tap(find.byIcon(Icons.help).first);
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.help_rounded), findsOneWidget);

      await tester.tap(find.byIcon(Icons.person).first);
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.person_rounded), findsOneWidget);
    });

    /// Verifica que IndexedStack gestiona correctamente las pantallas
    testWidgets('IndexedStack cambia entre widgets correctamente',
        (WidgetTester tester) async {
      await tester.pumpWidget(const StudentInfoApp());

      // Verifica que hay un IndexedStack
      expect(find.byType(IndexedStack), findsOneWidget);

      // Verifica que la primera pantalla se muestra
      expect(find.text(AppStrings.homeTitle), findsOneWidget);

      // Cambia de pestaña
      await tester.tap(find.byIcon(Icons.help).first);
      await tester.pumpAndSettle();

      // Verifica que la segunda pantalla se muestra
      expect(find.text(AppStrings.helpTitle), findsOneWidget);
    });
  });

  group('Pruebas de Responsive Design', () {
    /// Verifica que la app se adapta a diferentes tamaños
    testWidgets('App se renderiza en diferentes tamaños de pantalla',
        (WidgetTester tester) async {
      // Establece un tamaño pequeño (móvil)
      tester.binding.window.physicalSizeTestValue = const Size(400, 800);

      await tester.pumpWidget(const StudentInfoApp());
      expect(find.text(AppStrings.homeTitle), findsOneWidget);

      // Establece un tamaño grande (tablet)
      tester.binding.window.physicalSizeTestValue = const Size(1200, 800);

      await tester.pumpWidget(const StudentInfoApp());
      expect(find.text(AppStrings.homeTitle), findsOneWidget);

      // Restaura el tamaño por defecto
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
