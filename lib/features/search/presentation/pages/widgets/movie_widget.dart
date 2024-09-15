import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/text_styles.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({
    super.key,
    required this.vote,
    required this.voteCount,
    required this.language,
    required this.year,
    required this.image,
    required this.title,
    required this.onChanged,
  });

  final String vote;
  final String voteCount;
  final String language;
  final String year;
  final String image;
  final String title;
  final void Function()? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            // Movie Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                image, // Replace with the correct image URL
                width: 100,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),

            // Movie Information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title, // Movie Title
                    style: TextStyles.textStyles.poppinsRegular16.copyWith(color: Colors.white),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 8),

                  // Rating
                  Row(
                    children: [
                      Icon(
                        Icons.star_border,
                        color: Color(0xffFF8700),
                        size: 17,
                      ),
                      SizedBox(width: 4),
                      Text(
                        vote, // Movie Rating
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Genre
                  Row(
                    children: [
                      const Icon(Icons.language_rounded, color: Colors.white, size: 16),
                      const SizedBox(width: 4),
                      Text(language, // Movie Genre
                          style: TextStyles.textStyles.poppinsRegular12.copyWith(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Year
                  Row(
                    children: [
                      const Icon(Icons.calendar_today_outlined, color: Colors.white, size: 16),
                      const SizedBox(width: 4),
                      Text(year, // Movie Year
                          style: TextStyles.textStyles.poppinsRegular12.copyWith(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Duration
                  Row(
                    children: [
                      const Icon(CupertinoIcons.heart, color: Colors.white, size: 16),
                      const SizedBox(width: 4),
                      Text(voteCount, // Movie Duration
                          style: TextStyles.textStyles.poppinsRegular12.copyWith(color: Colors.white)),
                    ],
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
