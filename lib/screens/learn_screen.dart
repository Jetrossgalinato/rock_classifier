import 'package:flutter/material.dart';

class LearnScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final bool isDark;
  const LearnScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final lessons = [
      {
        'title': 'Igneous Rocks',
        'desc': 'Learn about volcanic and plutonic rocks',
        'icon': Icons.local_fire_department,
        'route': '/igneous-rocks',
      },
      {
        'title': 'Sedimentary Rocks',
        'desc': 'Explore layered rock formations',
        'icon': Icons.layers,
        'route': '/sedimentary-rocks',
      },
      {
        'title': 'Metamorphic Rocks',
        'desc': 'Discover transformed rock types',
        'icon': Icons.change_circle,
        'route': '/metamorphic-rocks',
      },
      {
        'title': 'Field Qualification',
        'desc': 'Tips for identifying rocks in the field',
        'icon': Icons.explore,
        'route': '/field-tips',
      },
      {
        'title': 'Mini Quizzes',
        'desc': 'Test your knowledge with interactive quizzes',
        'icon': Icons.quiz,
        'route': '/quizzes',
      },
      {
        'title': 'Geology Paths',
        'desc': 'Guided learning paths and resources',
        'icon': Icons.route,
        'route': '/geology-paths',
      },
    ];

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text('Learn'),
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
        itemCount: lessons.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final lesson = lessons[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, lesson['route'] as String);
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
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      lesson['icon'] as IconData,
                      color: colorScheme.primary,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lesson['title'] as String,
                          style: textTheme.bodyLarge?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          lesson['desc'] as String,
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
        },
      ),
    );
  }
}
