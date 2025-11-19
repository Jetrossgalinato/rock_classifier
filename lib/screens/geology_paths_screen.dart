import 'package:flutter/material.dart';

class GeologyPathsScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final bool isDark;
  const GeologyPathsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final paths = [
      {
        'title': 'Rock Identification Basics',
        'desc': 'Learn to identify common rocks and minerals',
        'lessons': '8 lessons',
        'duration': '2 hours',
        'progress': 0.0,
      },
      {
        'title': 'Geological Processes',
        'desc': 'Understanding how rocks form and change',
        'lessons': '10 lessons',
        'duration': '3 hours',
        'progress': 0.0,
      },
      {
        'title': 'Field Geology Mastery',
        'desc': 'Advanced field techniques and mapping',
        'lessons': '12 lessons',
        'duration': '4 hours',
        'progress': 0.0,
      },
      {
        'title': 'Mineralogy Fundamentals',
        'desc': 'Deep dive into mineral properties and classification',
        'lessons': '15 lessons',
        'duration': '5 hours',
        'progress': 0.0,
      },
    ];

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text('Geology Learning Paths'),
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
        itemCount: paths.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final path = paths[index];
          return InkWell(
            onTap: () {
              // Navigate to learning path
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: colorScheme.onSurface.withOpacity(0.1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.route,
                          color: colorScheme.primary,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              path['title'] as String,
                              style: textTheme.titleMedium?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              path['desc'] as String,
                              style: textTheme.bodySmall?.copyWith(
                                fontSize: 12,
                                color: colorScheme.onSurface.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        Icons.book_outlined,
                        size: 16,
                        color: colorScheme.onSurface.withOpacity(0.5),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        path['lessons'] as String,
                        style: TextStyle(
                          fontSize: 12,
                          color: colorScheme.onSurface.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.access_time,
                        size: 16,
                        color: colorScheme.onSurface.withOpacity(0.5),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        path['duration'] as String,
                        style: TextStyle(
                          fontSize: 12,
                          color: colorScheme.onSurface.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: path['progress'] as double,
                      backgroundColor: colorScheme.onSurface.withOpacity(0.1),
                      color: colorScheme.primary,
                      minHeight: 6,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${((path['progress'] as double) * 100).toInt()}% complete',
                    style: TextStyle(
                      fontSize: 12,
                      color: colorScheme.onSurface.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
