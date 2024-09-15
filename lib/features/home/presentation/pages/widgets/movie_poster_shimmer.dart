import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MoviePosterShimmer extends StatelessWidget {
  const MoviePosterShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Shimmer.fromColors(
        baseColor: const Color(0xff67686D),
        highlightColor: Colors.grey[400]!,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            color: const Color(0xff67686D),
            height: 200,
            width: 140,
          ),
        ),
      ),
    );
  }
}
