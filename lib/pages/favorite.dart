import 'package:calculator_app/components/natureCard.dart';
import 'package:calculator_app/components/nature_tile.dart';
import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  final List<NatureTile> favorites;

  const Favorite({required this.favorites, super.key});

  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 60, color: Colors.grey),
            SizedBox(height: 10),
            Text('No favorites yet'),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
      ),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return Naturecard(nature: favorites[index]);
      },
    );
  }
}
