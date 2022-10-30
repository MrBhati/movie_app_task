import 'package:fasai_task/model/wachlist_model.dart';
import 'package:fasai_task/theme/colors.dart';
import 'package:flutter/material.dart';

class WatchlistCard extends StatelessWidget {
  final MoviList? movie;
  const WatchlistCard({
    required this.movie,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: double.infinity,
        height: 80,
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
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(movie?.imgUrl ?? "")),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text(
                      movie?.name ?? "",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                  ])),
            ]));
  }
}
