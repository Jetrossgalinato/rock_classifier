import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final bool isDark;
  const SettingsScreen({
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
        title: const Text('Settings'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            tooltip: 'Toggle Theme',
            onPressed: onThemeToggle,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(context, 'Account', [
            _buildSettingItem(context, Icons.person, 'Edit Profile', () {}),
            _buildSettingItem(context, Icons.lock, 'Change Password', () {}),
            _buildSettingItem(context, Icons.email, 'Email Preferences', () {}),
          ]),
          const SizedBox(height: 20),
          _buildSection(context, 'Preferences', [
            _buildThemeToggleItem(context),
            _buildSettingItem(
              context,
              Icons.notifications,
              'Notifications',
              () {},
            ),
            _buildSettingItem(context, Icons.language, 'Language', () {}),
            _buildSettingItem(context, Icons.map, 'Map Settings', () {}),
          ]),
          const SizedBox(height: 20),
          _buildSection(context, 'Support', [
            _buildSettingItem(context, Icons.help, 'Help Center', () {}),
            _buildSettingItem(context, Icons.feedback, 'Send Feedback', () {}),
            _buildSettingItem(context, Icons.info, 'About', () {}),
            _buildSettingItem(
              context,
              Icons.description,
              'Terms of Service',
              () {},
            ),
            _buildSettingItem(
              context,
              Icons.privacy_tip,
              'Privacy Policy',
              () {},
            ),
          ]),
          const SizedBox(height: 20),
          _buildSection(context, 'Data', [
            _buildSettingItem(
              context,
              Icons.download,
              'Download My Data',
              () {},
            ),
            _buildSettingItem(context, Icons.clear, 'Clear Cache', () {}),
          ]),
          const SizedBox(height: 30),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  side: BorderSide(color: Colors.red.withOpacity(0.5)),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              'Version 1.0.0',
              style: textTheme.bodySmall?.copyWith(
                fontSize: 12,
                color: colorScheme.onSurface.withOpacity(0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> items) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title,
            style: textTheme.titleMedium?.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: colorScheme.primary,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colorScheme.onSurface.withOpacity(0.1)),
          ),
          child: Column(children: items),
        ),
      ],
    );
  }

  Widget _buildSettingItem(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: colorScheme.onSurface.withOpacity(0.6), size: 22),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: textTheme.bodyMedium?.copyWith(fontSize: 14),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: colorScheme.onSurface.withOpacity(0.3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeToggleItem(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(
            Icons.palette,
            color: colorScheme.onSurface.withOpacity(0.6),
            size: 22,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              'Dark Mode',
              style: textTheme.bodyMedium?.copyWith(fontSize: 14),
            ),
          ),
          Switch(
            value: isDark,
            onChanged: (value) => onThemeToggle(),
            activeColor: colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
