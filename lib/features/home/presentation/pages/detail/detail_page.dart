import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/theme/text_styles.dart';
import 'package:movie_app/features/home/presentation/bloc/movie_bloc.dart';
import 'package:movie_app/features/home/presentation/pages/detail/mixin/detail_mixin.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with DetailMixin {
  @override
  Widget build(BuildContext context) {
    // _loadmovies();
    return DefaultTabController(
      length: 3,
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xff242A32), // Dark theme
            appBar: AppBar(
              backgroundColor: const Color(0xff242A32),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  context.pop();
                },
              ),
              title: Text(
                "Detail",
                style: TextStyles.textStyles.poppinsSemiBold16.copyWith(color: Colors.white),
              ),
              actions: [
                IconButton(
                  icon: Icon(state.isBookmarked ? Icons.bookmark : Icons.bookmark_outline, color: Colors.white, size: 30),
                  onPressed: toggleBookmark,
                )
              ],
            ),
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                        image: DecorationImage(
                          image: NetworkImage('https://image.tmdb.org/t/p/w500${state.movie?.backdropPath}'), // replace with network image
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // GlassmorphismRating()
                    Positioned(
                      bottom: 10, // Adjust the distance from the bottom
                      left: MediaQuery.sizeOf(context).width - 100, // Adjust the distance from the left
                      child: GlassmorphismRating(vote: state.movie?.voteAverage.toStringAsFixed(1) ?? ''), // Positioning the Glassmorphism rating
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.translate(
                        offset: const Offset(0, -30),
                        child: Transform.scale(
                          scale: 1.5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SizedBox(
                              height: 80,
                              width: 60,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage('https://image.tmdb.org/t/p/w500${state.movie?.posterPath}'), // replace with network image
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child:
                            Text(state.movie?.title ?? '', style: TextStyles.textStyles.poppinsSemiBold18.copyWith(color: Colors.white), maxLines: 2),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(Icons.calendar_today_outlined, color: Color(0xff92929D), size: 17),
                      Text(
                        state.movie?.releaseDate.substring(0, 4) ?? "", //2021
                        style: const TextStyle(color: Color(0xff92929D)),
                        // TextStyles.textStyles.poppinsMedium12.copyWith(color: const Color(0xff92929D)),
                      ),
                      const SizedBox(
                        height: 16,
                        width: 0.75,
                        child: ColoredBox(color: Color(0xff92929D)),
                      ),
                      // const SizedBox(width: 8),
                      const Icon(CupertinoIcons.heart, color: Color(0xff92929D), size: 17),
                      Text(
                        state.movie?.voteCount.toString() ?? '',
                        style: const TextStyle(color: Color(0xff92929D)),
                      ),
                      const SizedBox(
                        height: 16,
                        width: 0.75,
                        child: ColoredBox(color: Color(0xff92929D)),
                      ),
                      // const SizedBox(width: 8),
                      const Icon(Icons.language_rounded, color: Color(0xff92929D), size: 17),
                      Text(
                        state.movie?.originalLanguage.toUpperCase() ?? '',
                        style: const TextStyle(color: Color(0xff92929D)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // TabBar section for movie details
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    indicatorColor: const Color(0xff3A3F47),
                    tabAlignment: TabAlignment.start,
                    indicatorWeight: 4,
                    dividerColor: Colors.transparent,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(child: Text('About Movie', style: TextStyles.textStyles.poppinsMedium14.copyWith(color: Colors.white))),
                      Tab(child: Text('Reviews', style: TextStyles.textStyles.poppinsMedium14.copyWith(color: Colors.white))),
                      Tab(child: Text('Cast', style: TextStyles.textStyles.poppinsMedium14.copyWith(color: Colors.white))),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          state.movie?.overview ?? '',
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                      const Center(child: Text('Reviews Section', style: TextStyle(color: Colors.white))),
                      const Center(child: Text('Cast Section', style: TextStyle(color: Colors.white))),
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

class GlassmorphismRating extends StatelessWidget {
  const GlassmorphismRating({super.key, required this.vote});
  final String vote;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.star_border,
                  color: Color(0xffFF8700),
                ),
                const SizedBox(width: 8),
                Text(
                  vote,
                  style: const TextStyle(
                    color: Color(0xffFF8700),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
