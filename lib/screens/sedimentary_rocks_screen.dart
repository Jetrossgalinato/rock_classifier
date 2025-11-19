import 'package:flutter/material.dart';

class SedimentaryRocksScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final bool isDark;
  const SedimentaryRocksScreen({
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
        'title': 'What are Sedimentary Rocks?',
        'content':
            'Sedimentary rocks form from the accumulation and lithification of sediment.',
      },
      {
        'title': 'Clastic Sedimentary',
        'content':
            'Formed from mechanical weathering debris like sandstone, shale, and conglomerate.',
      },
      {
        'title': 'Chemical Sedimentary',
        'content':
            'Formed when dissolved minerals precipitate from solution, like limestone and rock salt.',
      },
      {
        'title': 'Organic Sedimentary',
        'content':
            'Formed from the accumulation of plant or animal debris, like coal and chalk.',
      },
      {
        'title': 'Common Examples',
        'content': 'Sandstone, Limestone, Shale, Conglomerate, Coal',
      },
    ];

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text('Sedimentary Rocks'),
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
                    Icon(Icons.layers, color: colorScheme.primary, size: 24),
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
