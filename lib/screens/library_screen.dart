import 'package:flutter/material.dart';

class LibraryScreen extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final bool isDark;
  const LibraryScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDark,
  });

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  String searchQuery = '';
  String selectedFilter = 'All';

  // All rock types from rock_types_screen.dart
  final List<Map<String, String>> allRocks = [
    {
      'name': 'Gypsum',
      'desc': 'From the Greek gypsos, meaning "chalk" or "plaster."',
      'img': 'gypsum.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Mica',
      'desc':
          'From the Latin micare, meaning "to glitter," referring to its shiny appearance.',
      'img': 'mica.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Calcite',
      'desc':
          'From the Latin calx, meaning "lime," as it is a primary constituent of limestone.',
      'img': 'calcite.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Halite',
      'desc': 'From the Greek halos, meaning "salt."',
      'img': 'halite.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Fluorite',
      'desc':
          'From the Latin fluere, meaning "to flow," because it melts easily.',
      'img': 'fluorite.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Lepidolite',
      'desc':
          'From the Greek lepidos, meaning "scale," due to its scaly appearance.',
      'img': 'lepidolite.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Corundum',
      'desc': 'From the Tamil word kuruntam, referring to ruby or sapphire.',
      'img': 'corundum.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Beryl',
      'desc':
          'From the Greek beryllos, referring to the mineral\'s greenish-blue variety (aquamarine).',
      'img': 'beryl.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Topaz',
      'desc':
          'From the Greek topazos, named after the island of Topazios (modern-day St. John\'s Island in the Red Sea).',
      'img': 'topaz.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Magnetite',
      'desc':
          'From the name of the region Magnesia in Greece, known for magnetic stones.',
      'img': 'magnetite.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Hematite',
      'desc':
          'From the Greek haima, meaning "blood," referring to its red color when powdered.',
      'img': 'hematite.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Sphalerite',
      'desc':
          'From the Greek sphaleros, meaning "deceitful," because of its many possible appearances.',
      'img': 'sphalerite.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Galena',
      'desc': 'From the Latin galena, meaning "lead ore."',
      'img': 'galena.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Pyrite',
      'desc':
          'From the Greek pyrites lithos, meaning "stone which strikes fire," due to its ability to spark.',
      'img': 'pyrite.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Garnet',
      'desc':
          'From the Latin granatus, meaning "grain-like," due to the mineral\'s resemblance to pomegranate seeds.',
      'img': 'garnet.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Graphite',
      'desc':
          'From the Greek graphein, meaning "to write," because it was used in pencils.',
      'img': 'graphite.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Kyanite',
      'desc': 'From the Greek kyanos, meaning "blue."',
      'img': 'kyanite.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Chalcopyrite',
      'desc':
          'From the Greek chalkos (copper) and pyrites (stone that strikes fire), as it is a copper ore.',
      'img': 'chalcopyrite.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Malachite',
      'desc':
          'From the Greek malakos, meaning "soft," referring to the mineral\'s low hardness.',
      'img': 'malachite.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Azurite',
      'desc': 'From the Persian lazhward, meaning "blue."',
      'img': 'azurite.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Tourmaline',
      'desc': 'From the Sinhalese word turmali, meaning "mixed gems."',
      'img': 'tourmaline.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Olivine',
      'desc': 'From its olive green color.',
      'img': 'olivine.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Apatite',
      'desc':
          'From the Greek apate, meaning "deceit," because it was often mistaken for other minerals.',
      'img': 'apatite.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Spinel',
      'desc':
          'From the Latin spina, meaning "thorn," referring to its sharp crystal forms.',
      'img': 'spinel.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Zircon',
      'desc': 'From the Persian zargun, meaning "gold-colored."',
      'img': 'zircon.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Amethyst',
      'desc':
          'From the Greek amethystos, meaning "not drunk," as it was believed to prevent intoxication.',
      'img': 'amethyst.jpg',
      'type': 'Mineral',
    },
    {
      'name': 'Serpentine',
      'desc':
          'From the Latin serpens, meaning "serpent," due to its snake-like pattern.',
      'img': 'serpentine.jpg',
      'type': 'Mineral',
    },
  ];

  List<Map<String, String>> get filteredRocks {
    return allRocks.where((rock) {
      // Apply search filter
      final matchesSearch =
          searchQuery.isEmpty ||
          rock['name']!.toLowerCase().contains(searchQuery.toLowerCase()) ||
          rock['desc']!.toLowerCase().contains(searchQuery.toLowerCase());

      // Apply type filter
      final matchesFilter =
          selectedFilter == 'All' || rock['type'] == selectedFilter;

      return matchesSearch && matchesFilter;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text('Rock Library'),
        actions: [
          IconButton(
            icon: Icon(widget.isDark ? Icons.light_mode : Icons.dark_mode),
            tooltip: 'Toggle Theme',
            onPressed: widget.onThemeToggle,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search rocks by name or description...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            searchQuery = '';
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: colorScheme.surface,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip(context, 'All'),
                  const SizedBox(width: 8),
                  _buildFilterChip(context, 'Mineral'),
                  const SizedBox(width: 8),
                  _buildFilterChip(context, 'Igneous'),
                  const SizedBox(width: 8),
                  _buildFilterChip(context, 'Sedimentary'),
                  const SizedBox(width: 8),
                  _buildFilterChip(context, 'Metamorphic'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '${filteredRocks.length} rocks found',
              style: TextStyle(
                fontSize: 13,
                color: colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: filteredRocks.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: colorScheme.onSurface.withOpacity(0.3),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No rocks found',
                          style: TextStyle(
                            fontSize: 16,
                            color: colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try adjusting your search or filter',
                          style: TextStyle(
                            fontSize: 13,
                            color: colorScheme.onSurface.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.85,
                        ),
                    itemCount: filteredRocks.length,
                    itemBuilder: (context, index) {
                      final rock = filteredRocks[index];
                      return _buildRockCard(
                        context,
                        rock['name']!,
                        rock['type']!,
                        'assets/images/${rock['img']}',
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(BuildContext context, String label) {
    final colorScheme = Theme.of(context).colorScheme;
    final isSelected = selectedFilter == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primary : colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.onSurface.withOpacity(0.2),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildRockCard(
    BuildContext context,
    String name,
    String type,
    String image,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/rock-types'),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colorScheme.onSurface.withOpacity(0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(
                  image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    type,
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
      ),
    );
  }
}
