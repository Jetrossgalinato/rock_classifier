import 'package:flutter/material.dart';

class IdentifyScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final bool isDark;
  const IdentifyScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text('Identify Rocks'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            tooltip: 'Toggle Theme',
            onPressed: onThemeToggle,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Identification Method',
              style: textTheme.headlineMedium?.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 20),
            _buildMethodCard(
              context,
              icon: Icons.map_outlined,
              title: 'View Map',
              description: 'Select location to view rocks in the area',
              onTap: () => Navigator.pushNamed(context, '/map'),
            ),
            const SizedBox(height: 12),
            _buildMethodCard(
              context,
              icon: Icons.photo_camera,
              title: 'Visual Matcher',
              description: 'Upload photo for auto-detection',
              onTap: () => Navigator.pushNamed(context, '/visual-matcher'),
            ),
            const SizedBox(height: 12),
            _buildMethodCard(
              context,
              icon: Icons.science,
              title: 'Project Rock',
              description: 'Assign rock to lab log for teamwork',
              onTap: () => Navigator.pushNamed(context, '/project-rock'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMethodCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colorScheme.onSurface.withOpacity(0.1)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: colorScheme.primary),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.bodyLarge?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 13,
                      color: colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: colorScheme.onSurface.withOpacity(0.3),
            ),
          ],
        ),
      ),
    );
  }
}
