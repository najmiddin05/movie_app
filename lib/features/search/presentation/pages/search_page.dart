// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/app_icons.dart';

import 'package:movie_app/core/theme/text_styles.dart';
import 'package:movie_app/features/home/presentation/bloc/movie_bloc.dart';
import 'package:movie_app/features/search/presentation/pages/mixin/search_mixin.dart';
import 'package:movie_app/features/search/presentation/pages/widgets/movie_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SearchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242A32),
      appBar: AppBar(
        backgroundColor: const Color(0xff242A32),
        title: Text(
          'Search',
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF3A3F47),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: onChangedTextField,
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

          // Wrapping ListView.builder inside Expanded
          Expanded(
            child: BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state.filterData.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child: AppIcons.noResult),
                        const SizedBox(height: 15),
                        Text(
                          'we are sorry, we can not find the movie :(',
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
                  itemCount: state.filterData.length,
                  itemBuilder: (context, index) {
                    return MovieWidget(
                      onChanged: () {
                        goToReadPage(movie: state.filterData[index]);
                      },
                      vote: state.filterData[index].voteAverage.toString(),
                      voteCount: state.filterData[index].voteCount.toString(),
                      language: state.filterData[index].originalLanguage.toUpperCase(),
                      year: state.filterData[index].releaseDate,
                      image: 'https://image.tmdb.org/t/p/w500/${state.filterData[index].posterPath}',
                      title: state.filterData[index].title,
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
