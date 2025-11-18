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
    // Provided static data with etymologies
    final rocks = [
      {
        'name': 'Gypsum',
        'desc': 'From the Greek gypsos, meaning "chalk" or "plaster."',
        'img': 'gypsum.jpg',
      },
      {
        'name': 'Mica',
        'desc':
            'From the Latin micare, meaning "to glitter," referring to its shiny appearance.',
        'img': 'mica.jpg',
      },
      {
        'name': 'Calcite',
        'desc':
            'From the Latin calx, meaning "lime," as it is a primary constituent of limestone.',
        'img': 'calcite.jpg',
      },
      {
        'name': 'Halite',
        'desc': 'From the Greek halos, meaning "salt."',
        'img': 'halite.jpg',
      },
      {
        'name': 'Fluorite',
        'desc':
            'From the Latin fluere, meaning "to flow," because it melts easily.',
        'img': 'fluorite.jpg',
      },
      {
        'name': 'Lepidolite',
        'desc':
            'From the Greek lepidos, meaning "scale," due to its scaly appearance.',
        'img': 'lepidolite.jpg',
      },
      {
        'name': 'Corundum',
        'desc': 'From the Tamil word kuruntam, referring to ruby or sapphire.',
        'img': 'corundum.jpg',
      },
      {
        'name': 'Beryl',
        'desc':
            'From the Greek beryllos, referring to the mineral\'s greenish-blue variety (aquamarine).',
        'img': 'beryl.jpg',
      },
      {
        'name': 'Topaz',
        'desc':
            'From the Greek topazos, named after the island of Topazios (modern-day St. John\'s Island in the Red Sea).',
        'img': 'topaz.jpg',
      },
      {
        'name': 'Magnetite',
        'desc':
            'From the name of the region Magnesia in Greece, known for magnetic stones.',
        'img': 'magnetite.jpg',
      },
      {
        'name': 'Hematite',
        'desc':
            'From the Greek haima, meaning "blood," referring to its red color when powdered.',
        'img': 'hematite.jpg',
      },
      {
        'name': 'Sphalerite',
        'desc':
            'From the Greek sphaleros, meaning "deceitful," because of its many possible appearances.',
        'img': 'sphalerite.jpg',
      },
      {
        'name': 'Galena',
        'desc': 'From the Latin galena, meaning "lead ore."',
        'img': 'galena.jpg',
      },
      {
        'name': 'Pyrite',
        'desc':
            'From the Greek pyrites lithos, meaning "stone which strikes fire," due to its ability to spark.',
        'img': 'pyrite.jpg',
      },
      {
        'name': 'Garnet',
        'desc':
            'From the Latin granatus, meaning "grain-like," due to the mineral\'s resemblance to pomegranate seeds.',
        'img': 'garnet.jpg',
      },
      {
        'name': 'Graphite',
        'desc':
            'From the Greek graphein, meaning "to write," because it was used in pencils.',
        'img': 'graphite.jpg',
      },
      {
        'name': 'Kyanite',
        'desc': 'From the Greek kyanos, meaning "blue."',
        'img': 'kyanite.jpg',
      },
      {
        'name': 'Chalcopyrite',
        'desc':
            'From the Greek chalkos (copper) and pyrites (stone that strikes fire), as it is a copper ore.',
        'img': 'chalcopyrite.jpg',
      },
      {
        'name': 'Malachite',
        'desc':
            'From the Greek malakos, meaning "soft," referring to the mineral\'s low hardness.',
        'img': 'malachite.jpg',
      },
      {
        'name': 'Azurite',
        'desc': 'From the Persian lazhward, meaning "blue."',
        'img': 'azurite.jpg',
      },
      {
        'name': 'Tourmaline',
        'desc': 'From the Sinhalese word turmali, meaning "mixed gems."',
        'img': 'tourmaline.jpg',
      },
      {
        'name': 'Olivine',
        'desc': 'From its olive green color.',
        'img': 'olivine.jpg',
      },
      {
        'name': 'Apatite',
        'desc':
            'From the Greek apate, meaning "deceit," because it was often mistaken for other minerals.',
        'img': 'apatite.jpg',
      },
      {
        'name': 'Spinel',
        'desc':
            'From the Latin spina, meaning "thorn," referring to its sharp crystal forms.',
        'img': 'spinel.jpg',
      },
      {
        'name': 'Zircon',
        'desc': 'From the Persian zargun, meaning "gold-colored."',
        'img': 'zircon.jpg',
      },
      {
        'name': 'Amethyst',
        'desc':
            'From the Greek amethystos, meaning "not drunk," as it was believed to prevent intoxication.',
        'img': 'amethyst.jpg',
      },
      {
        'name': 'Serpentine',
        'desc':
            'From the Latin serpens, meaning "serpent," due to its snake-like pattern.',
        'img': 'serpentine.jpg',
      },
    ];
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
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
        padding: const EdgeInsets.all(12),
        itemCount: rocks.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final rock = rocks[index];
          return Container(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: colorScheme.onSurface.withOpacity(0.2)),
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (rock['img'] != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      'assets/images/${rock['img']}',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rock['name']!,
                        style: textTheme.headlineMedium?.copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        rock['desc']!,
                        style: textTheme.bodyMedium?.copyWith(
                          fontSize: 13,
                          color: colorScheme.onSurface.withOpacity(0.7),
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
