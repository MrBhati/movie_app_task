import 'package:fasai_task/custom_widget/main_button.dart';
import 'package:fasai_task/theme/colors.dart';
import 'package:fasai_task/theme/text_styles.dart';
import 'package:fasai_task/utils/util.dart';
import 'package:fasai_task/view_model/movie_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final map = ModalRoute.of(context)!.settings.arguments as Map;
    String imdbID = map["id"];
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: Consumer(builder: (context, ref, child) {
            final watchMovieDetailProvider = ref.watch(
                MovieDetailsScreenProvider.movieDetailsScreenProviderNotifier);
            if (watchMovieDetailProvider.movieDetailsModel == null) {
              ref
                  .read(MovieDetailsScreenProvider
                      .movieDetailsScreenProviderNotifier)
                  .getMovieDetail(context, imdbID);
            }

            return watchMovieDetailProvider.movieDetailsModel != null
                ? SizedBox(
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.bottom -
                        MediaQuery.of(context).padding.top,
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                            child: Column(
                          children: [
                            SizedBox(
                                height: 300,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Image.network(
                                          watchMovieDetailProvider
                                              .movieDetailsModel!.poster!,
                                          fit: BoxFit.cover),
                                    ),
                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: FractionalOffset.topCenter,
                                            end: FractionalOffset.bottomCenter,
                                            colors: [
                                              const Color(0xff191a32)
                                                  .withOpacity(0.10),
                                              const Color(0xff191a32)
                                                  .withOpacity(1.0)
                                            ],
                                            stops: const [0.0, 1.0],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      left: 20,
                                      right: 20,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              watchMovieDetailProvider
                                                      .movieDetailsModel
                                                      ?.title ??
                                                  "",
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w800)),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${watchMovieDetailProvider.movieDetailsModel?.year} | ${watchMovieDetailProvider.movieDetailsModel?.genre} ",
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.6),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "${watchMovieDetailProvider.movieDetailsModel?.imdbRating} IMDB Rating",
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.6),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${watchMovieDetailProvider.movieDetailsModel?.plot} ",
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Actors: ',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize: 14,
                                      ),
                                      children: [
                                        TextSpan(
                                            text:
                                                '${watchMovieDetailProvider.movieDetailsModel?.actors}',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.6),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Director: ',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize: 14,
                                      ),
                                      children: [
                                        TextSpan(
                                            text:
                                                '${watchMovieDetailProvider.movieDetailsModel?.director}',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.6),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Writer: ',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize: 14,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                '${watchMovieDetailProvider.movieDetailsModel?.writer}',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.6),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "${watchMovieDetailProvider.movieDetailsModel?.country} | ${watchMovieDetailProvider.movieDetailsModel?.language} ",
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Awards: ',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize: 14,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                '${watchMovieDetailProvider.movieDetailsModel?.awards}',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.6),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: MainButton(
                              width: double.infinity,
                              onPressed: () {
                                watchMovieDetailProvider
                                    .createWatchListInFirebase(context);

                                // AddPlayList(
                                //     model: watchMovieDetailProvider,
                                //     context: context,
                                //     title: "Add new Watchlist",
                                //     childWidget: Column(
                                //       crossAxisAlignment:
                                //           CrossAxisAlignment.start,
                                //       children: [
                                //         createNewPlaylist(
                                //             watchMovieDetailProvider),
                                //       ],
                                //     ),
                                //     onSave: () {
                                //       if (watchMovieDetailProvider
                                //           .wachlistKeyKey.currentState!
                                //           .validate()) {
                                //         print("Save new watchList");
                                //         watchMovieDetailProvider
                                //             .createWatchListInFirebase(
                                //                 context);
                                //         Navigator.pop(context);
                                //       }
                                //     });
                              },
                              height: 45,
                              borderRadius: BorderRadius.circular(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.favorite,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Add to My Watchlist',
                                    style: TextStryles.mainButtonText,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Util.loadingView();
          }),
        ));
  }

  // Widget createNewPlaylist(
  //     MovieDetailsScreenProvider watchMovieDetailProvider) {
  //   return Form(
  //     key: watchMovieDetailProvider.wachlistKeyKey,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text("Create new Wachlist".toUpperCase(),
  //             style: const TextStyle(
  //                 fontSize: 16,
  //                 color: AppColors.whiteColor,
  //                 fontFamily: 'InterRegular',
  //                 height: 1.5,
  //                 fontWeight: FontWeight.w700)),
  //         const SizedBox(
  //           height: 20,
  //         ),
  //         const Text(
  //           "Enter Wachlist name",
  //           style: TextStryles.textFiledText,
  //         ),
  //         TextFormField(
  //           controller: watchMovieDetailProvider.playlistNameController,
  //           style: const TextStyle(
  //             color: AppColors.whiteColor,
  //           ),
  //           decoration:
  //               AppColors.textInputDecoration(hint: "Eg. Action movies"),
  //           keyboardType: TextInputType.text,
  //           textInputAction: TextInputAction.next,
  //           validator: (value) {
  //             if (value!.length < 4) {
  //               return 'Please enter Wachlist Name its required';
  //             } else {
  //               return null;
  //             }
  //           },
  //         ),
  //         Row(
  //           children: [
  //             Container(
  //               width: 20,
  //               child: Checkbox(
  //                 value: watchMovieDetailProvider.ispublic,
  //                 onChanged: (value) {
  //                   watchMovieDetailProvider.updateCheckbox(value);
  //                 },
  //               ),
  //             ),
  //             const SizedBox(
  //               width: 6,
  //             ),
  //             const Text("Wachlist will be public?",
  //                 style: TextStyle(
  //                     fontSize: 16,
  //                     color: AppColors.whiteColor,
  //                     fontFamily: 'InterRegular',
  //                     height: 1.5,
  //                     fontWeight: FontWeight.w700)),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget exisitingPlaylist() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text("Select From Exsiting PlayList".toUpperCase(),
  //           style: TextStyle(
  //               fontSize: 12,
  //               color: AppColors.whiteColor,
  //               fontFamily: 'InterRegular',
  //               height: 1.5,
  //               fontWeight: FontWeight.w700)),
  //       Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: List.generate(8, (index) {
  //             return Text(
  //               "PlayList ${index}",
  //               style: TextStyle(
  //                 color: AppColors.whiteColor,
  //               ),
  //             );
  //           }))
  //     ],
  //   );
  // }

}
