import 'package:flutter/material.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

class MovieGridView extends StatelessWidget {
  const MovieGridView({super.key, required this.results, required this.onChanged});

  final List<MovieModel>? results;
  final void Function(int index)? onChanged; // Corrected signature of the function

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 0.7,
      ),
      itemCount: results?.length ?? 0, // Ensure non-null itemCount
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GestureDetector(
            onTap: () {
              if (onChanged != null) {
                onChanged!(index); // Correctly pass the index to the function
              }
            },
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${results![index].posterPath}',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.movie);
              },
            ),
          ),
        );
      },
    );
  }
}
