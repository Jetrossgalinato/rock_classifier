import 'package:flutter/material.dart';

class QuizzesScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final bool isDark;
  const QuizzesScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final quizzes = [
      {
        'title': 'Beginner Quiz',
        'desc': 'Basic rock identification and classification',
        'questions': '10 questions',
        'difficulty': 'Easy',
        'color': Colors.green,
      },
      {
        'title': 'Intermediate Quiz',
        'desc': 'Rock formation processes and mineral composition',
        'questions': '15 questions',
        'difficulty': 'Medium',
        'color': Colors.orange,
      },
      {
        'title': 'Advanced Quiz',
        'desc': 'Complex geology concepts and field identification',
        'questions': '20 questions',
        'difficulty': 'Hard',
        'color': Colors.red,
      },
      {
        'title': 'Igneous Rocks Challenge',
        'desc': 'Test your knowledge on volcanic and plutonic rocks',
        'questions': '12 questions',
        'difficulty': 'Medium',
        'color': Colors.orange,
      },
      {
        'title': 'Mineral Identification',
        'desc': 'Identify minerals based on properties',
        'questions': '15 questions',
        'difficulty': 'Medium',
        'color': Colors.orange,
      },
    ];

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text('Mini Quizzes'),
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
        itemCount: quizzes.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final quiz = quizzes[index];
          return InkWell(
            onTap: () {
              // Start quiz
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: (quiz['color'] as Color).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          quiz['difficulty'] as String,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: quiz['color'] as Color,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.quiz, color: colorScheme.primary, size: 24),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    quiz['title'] as String,
                    style: textTheme.titleMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    quiz['desc'] as String,
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 13,
                      color: colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.help_outline,
                        size: 16,
                        color: colorScheme.onSurface.withOpacity(0.5),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        quiz['questions'] as String,
                        style: TextStyle(
                          fontSize: 12,
                          color: colorScheme.onSurface.withOpacity(0.5),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Start Quiz',
                        style: TextStyle(
                          fontSize: 13,
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: colorScheme.primary,
                      ),
                    ],
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
