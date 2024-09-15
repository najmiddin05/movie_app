import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/theme/text_styles.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/bloc/movie_bloc.dart';
import 'package:movie_app/features/home/presentation/pages/home/mixin/home_mixin.dart';
import 'package:movie_app/features/home/presentation/pages/widgets/movie_grid_view.dart';
import 'package:movie_app/features/home/presentation/pages/widgets/movie_poster.dart';
import 'package:movie_app/features/home/presentation/pages/widgets/movie_poster_shimmer.dart';
import 'package:movie_app/features/home/presentation/pages/widgets/shimmer_loading.dart';
import 'package:movie_app/router/name_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xff242A32),
        body: BlocListener<MovieBloc, MovieState>(
          listener: (context, state) {
            if (state.status == MovieStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to load movies')),
              );
            }

            if (state.status == MovieStatus.goDetailPage) {}
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top part with text
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 25, right: 25),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('What do you want to watch?', style: TextStyles.textStyles.poppinsSemiBold18.copyWith(color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF3A3F47), // Dark color for background
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            onTap: () {
                              context.go(Routes.search);
                            },
                            cursorColor: Colors.white,
                            style: const TextStyle(
                              color: Colors.white, // Text color
                            ),
                            decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyles.textStyles.poppinsRegular14.copyWith(color: const Color(0xff67686D)), // Hint text color
                              border: InputBorder.none, // No visible border
                            ),
                          ),
                        ),
                        const Icon(
                          CupertinoIcons.search,
                          color: Colors.grey, // Icon color
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: BlocBuilder<MovieBloc, MovieState>(
                  builder: (context, state) {
                    List<MovieModel>? results = state.dataTopRated?.results;

                    if (state.status == MovieStatus.loading) {
                      return SizedBox(
                        height: 200,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(left: 20),
                          scrollDirection: Axis.horizontal,
                          itemCount: 6, // Placeholder items during loading
                          itemBuilder: (context, index) {
                            return const MoviePosterShimmer(); // Display shimmer placeholders
                          },
                        ),
                      );
                    } else if (state.status == MovieStatus.error) {
                      return const Center(child: Text('Error loading data'));
                    } else {
                      return SizedBox(
                        height: 200,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(left: 20),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.dataTopRated?.results.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                goToReadPage(movie: results[index]);
                              },
                              child: MoviePoster(
                                imageUrl: 'https://image.tmdb.org/t/p/w500${results![index].posterPath}',
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ),

              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                indicatorColor: const Color(0xff3A3F47),
                indicatorWeight: 4,
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(child: Text('Now playing', style: TextStyles.textStyles.poppinsMedium14.copyWith(color: Colors.white))),
                  Tab(child: Text('Upcoming', style: TextStyles.textStyles.poppinsMedium14.copyWith(color: Colors.white))),
                  Tab(child: Text('Top rated', style: TextStyles.textStyles.poppinsMedium14.copyWith(color: Colors.white))),
                  Tab(child: Text('Popular', style: TextStyles.textStyles.poppinsMedium14.copyWith(color: Colors.white))),
                ],
              ),

              // TabBarView for displaying corresponding content
              Expanded(
                child: BlocBuilder<MovieBloc, MovieState>(
                  builder: (context, state) {
                    if (state.status == MovieStatus.loading) {
                      return ShimmerLoading();
                    } else if (state.status == MovieStatus.error) {
                      return const Center(child: Text('Error loading data'));
                    } else {
                      return TabBarView(
                        children: [
                          MovieGridView(
                              results: state.dataNowPlaying?.results,
                              onChanged: (index) {
                                goToReadPage(movie: state.dataNowPlaying!.results[index]);
                              }),
                          MovieGridView(
                              results: state.dataUpcoming?.results,
                              onChanged: (index) {
                                goToReadPage(movie: state.dataUpcoming!.results[index]);
                              }),
                          MovieGridView(
                              results: state.dataTopRated?.results,
                              onChanged: (index) {
                                goToReadPage(movie: state.dataTopRated!.results[index]);
                              }),
                          MovieGridView(
                              results: state.dataPopular?.results,
                              onChanged: (index) {
                                goToReadPage(movie: state.dataPopular!.results[index]);
                              }),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
