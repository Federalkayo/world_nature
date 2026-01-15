// homeContent.dart
import 'package:calculator_app/components/nature_tile.dart';
import 'package:calculator_app/components/natureCard.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  final Function(NatureTile) onToggleFavorite;
  final bool Function(NatureTile) isFavorite;

  const HomeContent({
    required this.onToggleFavorite,
    required this.isFavorite,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _natureTypeButton(),
        _title(),
        Expanded(child: _naturePic()),
      ],
    );
  }

  Widget _natureTypeButton() {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: FilledButton(onPressed: null, child: Text('Landscape')),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: FilledButton(onPressed: null, child: Text('Mountains')),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: FilledButton(onPressed: null, child: Text('Forest')),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: FilledButton(onPressed: null, child: Text('Ocean')),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Hot Nature Pics ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
              const Icon(Icons.local_fire_department, color: Colors.orange),
            ],
          ),
          TextButton(
            onPressed: () {}, // you can implement "See all" later
            child: const Text('See all'),
          ),
        ],
      ),
    );
  }

  Widget _naturePic() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 3 / 4,
        ),
        itemCount: natures.length,
        itemBuilder: (context, index) {
          final nature = natures[index];
          final favorited = isFavorite(nature);

          return Naturecard(
            nature: nature,
            // We add favorite button overlay
            child: Stack(
              children: [
                // Your original card content goes here (image, title, etc)

                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      favorited ? Icons.favorite : Icons.favorite_border,
                      color: favorited ? Colors.red : Colors.white,
                      size: 32,
                      shadows: const [
                        Shadow(blurRadius: 4, color: Colors.black54),
                      ],
                    ),
                    onPressed: () => onToggleFavorite(nature),
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