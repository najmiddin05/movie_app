import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/app_icons.dart';
import 'package:movie_app/core/theme/text_styles.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/bloc/movie_bloc.dart';
import 'package:movie_app/features/search/presentation/pages/widgets/movie_widget.dart';
import 'package:movie_app/features/watch_list/presentation/pages/mixin/watch_list_mixin.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({super.key});

  @override
  State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> with WatchListMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242A32),
      appBar: AppBar(
        backgroundColor: const Color(0xff242A32),
        title: Text(
          'Watch list',
          style: TextStyles.textStyles.poppinsSemiBold16.copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                final List<MovieModel> combinedMovies = [
                  ...?state.dataNowPlaying?.results,
                  ...?state.dataPopular?.results,
                  ...?state.dataTopRated?.results,
                  ...?state.dataUpcoming?.results,
                ];

                final Set<int> uniqueMovieIds = {};
                final List<MovieModel> watchListMovies = [];

                for (var movie in combinedMovies) {
                  if (state.ids.contains(movie.id) && !uniqueMovieIds.contains(movie.id)) {
                    watchListMovies.add(movie);
                    uniqueMovieIds.add(movie.id);
                  }
                }

                if (watchListMovies.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child: AppIcons.magicBox),
                        const SizedBox(height: 15),
                        Text(
                          'There is no movie yet!',
                          style: TextStyles.textStyles.poppinsSemiBold16.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Find your movie by Type title, categories, years, etc ',
                          style: TextStyles.textStyles.poppinsMedium12.copyWith(color: const Color(0xff92929D)),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: watchListMovies.length,
                  itemBuilder: (context, index) {
                    final movie = watchListMovies[index];
                    return MovieWidget(
                      onChanged: () {
                        goToReadPage(movie: movie);
                      },
                      vote: movie.voteAverage.toString(),
                      voteCount: movie.voteCount.toString(),
                      language: movie.originalLanguage.toUpperCase(),
                      year: movie.releaseDate,
                      image: 'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                      title: movie.title,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
