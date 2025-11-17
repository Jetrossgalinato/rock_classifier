import 'package:flutter/material.dart';

class RockTypesScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final bool isDark;
  const RockTypesScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    // Example static data
    final rocks = [
      {
        'name': 'Granite',
        'desc': 'A common type of felsic intrusive igneous rock.',
      },
      {'name': 'Basalt', 'desc': 'A mafic extrusive igneous rock.'},
      {
        'name': 'Limestone',
        'desc': 'A sedimentary rock composed mainly of calcium carbonate.',
      },
      {
        'name': 'Sandstone',
        'desc':
            'A clastic sedimentary rock composed mainly of sand-sized minerals.',
      },
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Rock Types'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            tooltip: 'Toggle Theme',
            onPressed: onThemeToggle,
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(24),
        itemCount: rocks.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final rock = rocks[index];
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rock['name']!,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  rock['desc']!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
