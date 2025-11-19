import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final bool isDark;
  const HomeScreen({
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
        title: const Text('Rock Classifier'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            tooltip: 'Toggle Theme',
            onPressed: onThemeToggle,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Rock Classifier',
              style: textTheme.headlineMedium?.copyWith(fontSize: 22),
            ),
            const SizedBox(height: 8),
            Text(
              'Explore rocks, learn geology, and connect with the community',
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 13,
                color: colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  _buildDashboardCard(
                    context,
                    icon: Icons.search,
                    title: 'Identify Rocks',
                    color: colorScheme.primary,
                    onTap: () => Navigator.pushNamed(context, '/identify'),
                  ),
                  _buildDashboardCard(
                    context,
                    icon: Icons.library_books,
                    title: 'Rock Library',
                    color: colorScheme.secondary,
                    onTap: () => Navigator.pushNamed(context, '/library'),
                  ),
                  _buildDashboardCard(
                    context,
                    icon: Icons.school,
                    title: 'Learn',
                    color: const Color(0xFF7FC6E6),
                    onTap: () => Navigator.pushNamed(context, '/learn'),
                  ),
                  _buildDashboardCard(
                    context,
                    icon: Icons.people,
                    title: 'Community',
                    color: const Color(0xFFBFA39E),
                    onTap: () => Navigator.pushNamed(context, '/community'),
                  ),
                  _buildDashboardCard(
                    context,
                    icon: Icons.person,
                    title: 'Profile',
                    color: colorScheme.primary.withOpacity(0.7),
                    onTap: () => Navigator.pushNamed(context, '/profile'),
                  ),
                  _buildDashboardCard(
                    context,
                    icon: Icons.settings,
                    title: 'Settings',
                    color: colorScheme.onSurface.withOpacity(0.5),
                    onTap: () => Navigator.pushNamed(context, '/settings'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colorScheme.onSurface.withOpacity(0.1)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
