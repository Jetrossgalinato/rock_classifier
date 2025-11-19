import 'package:flutter/material.dart';

class MetamorphicRocksScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final bool isDark;
  const MetamorphicRocksScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final topics = [
      {
        'title': 'What are Metamorphic Rocks?',
        'content':
            'Metamorphic rocks form when existing rocks are transformed by heat, pressure, or chemical processes.',
      },
      {
        'title': 'Contact Metamorphism',
        'content':
            'Occurs when rocks are heated by nearby magma, causing localized changes.',
      },
      {
        'title': 'Regional Metamorphism',
        'content':
            'Occurs over large areas during mountain building, involving both heat and pressure.',
      },
      {
        'title': 'Foliated vs Non-Foliated',
        'content':
            'Foliated rocks have layered appearance (slate, schist), non-foliated do not (marble, quartzite).',
      },
      {
        'title': 'Common Examples',
        'content': 'Marble, Slate, Gneiss, Schist, Quartzite',
      },
    ];

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text('Metamorphic Rocks'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            tooltip: 'Toggle Theme',
            onPressed: onThemeToggle,
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: topics.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final topic = topics[index];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.onSurface.withOpacity(0.1)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.change_circle,
                      color: colorScheme.primary,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        topic['title']!,
                        style: textTheme.titleMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  topic['content']!,
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: colorScheme.onSurface.withOpacity(0.7),
                    height: 1.5,
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
