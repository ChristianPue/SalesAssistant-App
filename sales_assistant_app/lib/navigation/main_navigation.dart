import 'package:flutter/material.dart';
import '../core/constants/app_strings.dart';
import '../presentation/screens/home/home_screen.dart';
import '../presentation/screens/help/help_screen.dart';
import '../presentation/screens/profile/profile_screen.dart';

/// Navegación principal de la aplicación
/// Maneja la barra de navegación inferior y el cambio entre pantallas
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  /// Lista de pantallas disponibles en la navegación
  /// Usar un getter permite lazy loading de las pantallas
  List<Widget> get _screens => [
        const HomeScreen(),
        const HelpScreen(),
        const ProfileScreen(),
      ];

  /// Elementos de la barra de navegación
  /// Separado del build para mejor organización
  List<BottomNavigationBarItem> get _navigationItems => const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: AppStrings.homeTitle,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.help_outline),
          activeIcon: Icon(Icons.help),
          label: AppStrings.helpTitle,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: AppStrings.profileTitle,
        ),
      ];

  /// Maneja el cambio de pantalla
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: _navigationItems,
      ),
    );
  }
}
