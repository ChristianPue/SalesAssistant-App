import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../../widgets/custom_app_bar.dart';

/// Pantalla de Perfil
/// Mostrará información del usuario y configuración
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.profileTitle,
      ),
      body: _buildBody(context),
    );
  }

  /// Construye el contenido de la pantalla
  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_rounded,
            size: 100,
            color: Theme.of(context).primaryColor.withOpacity(0.3),
          ),
          const SizedBox(height: 24),
          Text(
            AppStrings.profileTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 12),
          Text(
            AppStrings.comingSoon,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
