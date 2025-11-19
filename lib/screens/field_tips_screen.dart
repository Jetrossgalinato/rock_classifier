import 'package:flutter/material.dart';

class FieldTipsScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final bool isDark;
  const FieldTipsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final tips = [
      {
        'title': 'Safety First',
        'content':
            'Always wear protective gear, inform someone of your location, and be aware of weather conditions.',
        'icon': Icons.health_and_safety,
      },
      {
        'title': 'Essential Tools',
        'content':
            'Bring a rock hammer, hand lens, field notebook, GPS device, and sample bags.',
        'icon': Icons.construction,
      },
      {
        'title': 'Observation Techniques',
        'content':
            'Note color, texture, grain size, hardness, and any visible minerals or fossils.',
        'icon': Icons.search,
      },
      {
        'title': 'Sample Collection',
        'content':
            'Take representative samples, label them immediately, and record GPS coordinates.',
        'icon': Icons.inventory,
      },
      {
        'title': 'Rock Hardness Test',
        'content':
            'Use Mohs scale: fingernail (2.5), copper penny (3.5), glass (5.5), steel file (6.5).',
        'icon': Icons.science,
      },
      {
        'title': 'Field Photography',
        'content':
            'Photograph samples with scale reference, take close-ups and context shots.',
        'icon': Icons.camera_alt,
      },
    ];

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text('Field Qualification Tips'),
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
        itemCount: tips.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final tip = tips[index];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.onSurface.withOpacity(0.1)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    tip['icon'] as IconData,
                    color: colorScheme.primary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tip['title'] as String,
                        style: textTheme.titleMedium?.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        tip['content'] as String,
                        style: textTheme.bodyMedium?.copyWith(
                          fontSize: 13,
                          color: colorScheme.onSurface.withOpacity(0.7),
                          height: 1.4,
                        ),
                      ),
                    ],
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
