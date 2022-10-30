import 'package:fasai_task/constants/screen_names.dart';
import 'package:fasai_task/custom_widget/movie_hr_card.dart';
import 'package:fasai_task/custom_widget/movie_vr_card.dart';
import 'package:fasai_task/theme/colors.dart';
import 'package:fasai_task/utils/util.dart';
import 'package:fasai_task/view_model/home_screen_provider.dart';
import 'package:fasai_task/view_model/movie_details_provider.dart';
import 'package:fasai_task/view_model/otheruesrs_wachlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/custom_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Consumer(builder: (context, ref, child) {
          final watchHomeProvider =
              ref.watch(HomeScreenProvider.homeScreenProviderNotifier);
          if (watchHomeProvider.hrsearchModel == null) {
            watchHomeProvider.getHRMovilist(context);
          }
          if (watchHomeProvider.vrsearchModel == null) {
            watchHomeProvider.getVRMovilist(context);
          }
          return Container(
            padding: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hello ${watchHomeProvider.userNamr}",
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal)),
                          const SizedBox(height: 5),
                          const Text("Welcome back to Mononton",
                              style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.italic)),
                        ],
                      ),
                      Container(
                        width: 56,
                        height: 56,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/user.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    onChanged: (value) {
                      watchHomeProvider.getSearchMovilist(context, value);
                    },
                    decoration: AppColors.searchEditTexDecoration(
                        hint: "Search movie by name/catogery",
                        onTabSuffix: () {
                          watchHomeProvider.resetSearch();
                        }),
                  ),
                  const SizedBox(height: 24),
                  watchHomeProvider.searchModel != null
                      ? Column(
                          children: List.generate(
                              watchHomeProvider.searchMovilist.length, (index) {
                            return InkWell(
                                onTap: () {
                                  ref
                                      .read(MovieDetailsScreenProvider
                                          .movieDetailsScreenProviderNotifier)
                                      .movieDetailsModel = null;
                                  Navigator.pushNamed(context, movieList,
                                      arguments: {
                                        "id": watchHomeProvider
                                            .searchMovilist[index].imdbID
                                      });
                                  //  push(context, MOVIE_DETAILS);
                                },
                                child: MovieVRCard(
                                  search:
                                      watchHomeProvider.searchMovilist[index],
                                ));
                          }),
                        )
                      : const SizedBox(),
                  InkWell(
                    onTap: () {
                      push(context, wachlistScreen);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor.withOpacity(0.1),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.darkPrimearyColor.withOpacity(0.1),
                            offset: const Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("My Wachlist!",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal)),
                          Text("Wachlist avilable ",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      ref
                          .read(UsersWatchlistProvider
                              .usersWachlistProviderNotifier)
                          .wachlists = [];
                      push(context, userWachlist);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor.withOpacity(0.1),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.darkPrimearyColor.withOpacity(0.1),
                            offset: const Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Other users wachlist!",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal)),
                          Text("Wachlist avilable",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 260,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.darkPrimearyColor,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage('assets/images/marvel.jpg')),
                    ),
                    //  color: AppColors.whiteColor,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter,
                                colors: [
                                  const Color(0xff191a32).withOpacity(0.80),
                                  const Color(0xff191a32).withOpacity(0.30)
                                ],
                                stops: const [0.0, 1.0],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(12, 24, 12, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "The Marvel ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: watchHomeProvider.hrsearchModel != null
                                      ? Row(
                                          children: List.generate(
                                              watchHomeProvider
                                                  .hrMovilist.length, (index) {
                                            return InkWell(
                                                onTap: () {
                                                  ref
                                                      .read(MovieDetailsScreenProvider
                                                          .movieDetailsScreenProviderNotifier)
                                                      .movieDetailsModel = null;
                                                  Navigator.pushNamed(
                                                      context, movieList,
                                                      arguments: {
                                                        "id": watchHomeProvider
                                                            .hrMovilist[index]
                                                            .imdbID
                                                      });
                                                },
                                                child: MovieHRCard(
                                                  search: watchHomeProvider
                                                      .hrMovilist[index],
                                                ));
                                          }),
                                        )
                                      : Util.loadingView(),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Column(
                    children: List.generate(watchHomeProvider.vrMovilist.length,
                        (index) {
                      return InkWell(
                          onTap: () {
                            ref
                                .read(MovieDetailsScreenProvider
                                    .movieDetailsScreenProviderNotifier)
                                .movieDetailsModel = null;
                            Navigator.pushNamed(context, movieList, arguments: {
                              "id": watchHomeProvider.vrMovilist[index].imdbID
                            });
                          },
                          child: MovieVRCard(
                            search: watchHomeProvider.vrMovilist[index],
                          ));
                    }),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
