import 'package:flutter/material.dart';

class IgneousRocksScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final bool isDark;
  const IgneousRocksScreen({
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
        'title': 'What are Igneous Rocks?',
        'content':
            'Igneous rocks form from the cooling and solidification of molten magma or lava.',
      },
      {
        'title': 'Volcanic (Extrusive) Rocks',
        'content':
            'Formed when lava cools quickly on Earth\'s surface, creating fine-grained textures.',
      },
      {
        'title': 'Plutonic (Intrusive) Rocks',
        'content':
            'Formed when magma cools slowly beneath the surface, creating coarse-grained crystals.',
      },
      {
        'title': 'Common Examples',
        'content': 'Basalt, Granite, Pumice, Obsidian, Rhyolite, Gabbro',
      },
    ];

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text('Igneous Rocks'),
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
                      Icons.local_fire_department,
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
