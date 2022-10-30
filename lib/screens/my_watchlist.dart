import 'package:fasai_task/constants/custom_constants.dart';
import 'package:fasai_task/constants/screen_names.dart';
import 'package:fasai_task/custom_widget/watchlist_card.dart';
import 'package:fasai_task/theme/colors.dart';
import 'package:fasai_task/utils/util.dart';
import 'package:fasai_task/view_model/movie_details_provider.dart';
import 'package:fasai_task/view_model/mywatchlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyWachListScreen extends StatelessWidget {
  const MyWachListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Consumer(builder: (context, ref, child) {
          final watchMyWachlistProvider =
              ref.watch(MyWatchlistProvider.myWachlistProviderNotifier);
          watchMyWachlistProvider.getMyWachlist();
          return Container(
            padding: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: watchMyWachlistProvider.wachlist != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("My Wachlist",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal)),
                            Row(
                              children: [
                                const Text("Public wachlist?",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Switch(
                                  onChanged: (value) {
                                    watchMyWachlistProvider
                                        .updateWachlistVisiblity(
                                            value, context);
                                  },
                                  value: watchMyWachlistProvider
                                          .wachlist?.isPublic ??
                                      false,
                                  inactiveThumbColor:
                                      AppColors.primaryColor.withOpacity(0.7),
                                  inactiveTrackColor:
                                      AppColors.whiteColor.withOpacity(0.6),
                                  activeColor: AppColors.accentColor,
                                  activeTrackColor:
                                      AppColors.whiteColor.withOpacity(0.6),
                                  // ...
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 24),
                        watchMyWachlistProvider.wachlist!.moviList!.isNotEmpty
                            ? Column(
                                children: List.generate(
                                    watchMyWachlistProvider
                                        .wachlist!.moviList!.length, (index) {
                                  return InkWell(
                                      onTap: () {
                                        ref
                                            .read(MovieDetailsScreenProvider
                                                .movieDetailsScreenProviderNotifier)
                                            .movieDetailsModel = null;
                                        push(context, movieList, map: {
                                          "id": watchMyWachlistProvider
                                              .wachlist!.moviList![index].id
                                        });
                                      },
                                      child: WatchlistCard(
                                          movie: watchMyWachlistProvider
                                              .wachlist!.moviList![index]));
                                }),
                              )
                            : const Text("No WatchList Found!",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal)),
                      ],
                    )
                  : Center(child: Util.loadingView()),
            ),
          );
        }),
      ),
    );
  }
}
