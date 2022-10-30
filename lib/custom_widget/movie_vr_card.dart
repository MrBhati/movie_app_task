import 'package:fasai_task/model/search_model.dart';
import 'package:fasai_task/theme/colors.dart';
import 'package:flutter/material.dart';

class MovieVRCard extends StatelessWidget {
  final Search? search;
  const MovieVRCard({Key? key, this.search}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(0.1),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkPrimearyColor.withOpacity(0.1),
            offset: const Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 140,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(search!.poster!)),
            ),
          ),
          const SizedBox(width: 10),
          // The long text inside this column overflows. Remove the row and column above this comment and the text wraps.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 20),
                Text(
                  search?.title ?? "",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Text(
                  "Type: ${search?.type}",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Release year: ${search?.year}",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
