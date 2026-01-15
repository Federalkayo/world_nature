import 'package:flutter/material.dart';
import 'package:calculator_app/components/nature_tile.dart';

class Naturecard extends StatefulWidget {
  final NatureTile nature;
  const Naturecard({required this.nature, super.key, required Stack child});

  @override
  State<Naturecard> createState() => _NaturecardState();
}

class _NaturecardState extends State<Naturecard> {
  @override
  Widget build(BuildContext context) {
    final nature = widget.nature; // easy reference

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              nature.image,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nature.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      nature.location,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      nature.isfavorite = !nature.isfavorite;
                    });
                  },
                  icon: Icon(
                    nature.isfavorite ? Icons.favorite : Icons.favorite_border,
                    color: nature.isfavorite ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
