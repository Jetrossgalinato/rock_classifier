import 'package:flutter/material.dart';

class AchievementsScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final bool isDark;
  const AchievementsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final unlockedAchievements = [
      {
        'title': 'First Steps',
        'desc': 'Identify your first rock',
        'icon': Icons.stars,
        'date': 'January 15, 2024',
        'unlocked': true,
      },
      {
        'title': 'Rock Collector',
        'desc': 'Collect 10 different rocks',
        'icon': Icons.collections,
        'date': 'January 18, 2024',
        'unlocked': true,
      },
      {
        'title': 'Knowledge Seeker',
        'desc': 'Complete 5 lessons',
        'icon': Icons.school,
        'date': 'January 20, 2024',
        'unlocked': true,
      },
      {
        'title': 'Quiz Master',
        'desc': 'Score 100% on any quiz',
        'icon': Icons.emoji_events,
        'date': 'January 22, 2024',
        'unlocked': true,
      },
    ];

    final lockedAchievements = [
      {
        'title': 'Master Geologist',
        'desc': 'Identify 50 different rocks',
        'icon': Icons.workspace_premium,
        'progress': '42/50',
        'unlocked': false,
      },
      {
        'title': 'Field Expert',
        'desc': 'Complete all field tips',
        'icon': Icons.explore,
        'progress': '4/6',
        'unlocked': false,
      },
      {
        'title': 'Community Leader',
        'desc': 'Get 100 likes on your posts',
        'icon': Icons.people,
        'progress': '67/100',
        'unlocked': false,
      },
      {
        'title': 'Perfect Score',
        'desc': 'Score 100% on all quizzes',
        'icon': Icons.grade,
        'progress': '3/5',
        'unlocked': false,
      },
    ];

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text('Achievements'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            tooltip: 'Toggle Theme',
            onPressed: onThemeToggle,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: colorScheme.onSurface.withOpacity(0.1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatColumn(
                    context,
                    '${unlockedAchievements.length}',
                    'Unlocked',
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: colorScheme.onSurface.withOpacity(0.1),
                  ),
                  _buildStatColumn(
                    context,
                    '${lockedAchievements.length}',
                    'Locked',
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: colorScheme.onSurface.withOpacity(0.1),
                  ),
                  _buildStatColumn(context, '156', 'Points'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Unlocked',
              style: textTheme.titleMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: unlockedAchievements.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final achievement = unlockedAchievements[index];
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: colorScheme.primary.withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          achievement['icon'] as IconData,
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
                              achievement['title'] as String,
                              style: textTheme.bodyMedium?.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              achievement['desc'] as String,
                              style: TextStyle(
                                fontSize: 12,
                                color: colorScheme.onSurface.withOpacity(0.6),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              achievement['date'] as String,
                              style: TextStyle(
                                fontSize: 11,
                                color: colorScheme.onSurface.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.check_circle,
                        color: colorScheme.primary,
                        size: 24,
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            Text(
              'Locked',
              style: textTheme.titleMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 12),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: lockedAchievements.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final achievement = lockedAchievements[index];
                return Container(
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
                          color: colorScheme.onSurface.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          achievement['icon'] as IconData,
                          color: colorScheme.onSurface.withOpacity(0.3),
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              achievement['title'] as String,
                              style: textTheme.bodyMedium?.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface.withOpacity(0.5),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              achievement['desc'] as String,
                              style: TextStyle(
                                fontSize: 12,
                                color: colorScheme.onSurface.withOpacity(0.4),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              achievement['progress'] as String,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.lock_outline,
                        color: colorScheme.onSurface.withOpacity(0.3),
                        size: 24,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(BuildContext context, String value, String label) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}
