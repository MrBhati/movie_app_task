import 'package:fasai_task/theme/colors.dart';
import 'package:fasai_task/utils/util.dart';
import 'package:fasai_task/view_model/otheruesrs_wachlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UsersWachListScreen extends StatelessWidget {
  const UsersWachListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Consumer(builder: (context, ref, child) {
          final watchusersWachlistProvider =
              ref.watch(UsersWatchlistProvider.usersWachlistProviderNotifier);
          if (watchusersWachlistProvider.wachlists.isEmpty) {
            watchusersWachlistProvider.getUsersWachlist();
          }

          return Container(
            padding: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "All watchlist (${watchusersWachlistProvider.wachlists.length})",
                          style: const TextStyle(
                              fontSize: 25,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  watchusersWachlistProvider.wachlists.isNotEmpty
                      ? Column(
                          children: List.generate(
                              watchusersWachlistProvider.wachlists.length,
                              (index) {
                            return InkWell(
                                child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              width: double.infinity,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor.withOpacity(0.1),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.darkPrimearyColor
                                        .withOpacity(0.1),
                                    offset: const Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                        watchusersWachlistProvider
                                                .wachlists[index].name ??
                                            "",
                                        maxLines: 2,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal)),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          "Avilable Movies : ${watchusersWachlistProvider.wachlists[index].moviList!.length.toString()}",
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal)),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      watchusersWachlistProvider
                                              .wachlists[index].isPublic!
                                          ? Icon(
                                              Icons.public,
                                              size: 15,
                                              color: AppColors.whiteColor
                                                  .withOpacity(0.6),
                                            )
                                          : Icon(
                                              Icons.lock,
                                              size: 15,
                                              color: AppColors.whiteColor
                                                  .withOpacity(0.6),
                                            )
                                    ],
                                  ),
                                ],
                              ),
                            ));
                          }),
                        )
                      : Util.loadingView()
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
