import 'package:fasai_task/model/search_model.dart';
import 'package:flutter/material.dart';

class MovieHRCard extends StatelessWidget {
  final Search? search;
  const MovieHRCard({Key? key, this.search}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      height: 180,
      width: 120,
      // color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 1,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(search!.poster!)),
              ),
            ),
          ),
          Positioned.fill(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(0)),
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    const Color(0xff191a32).withOpacity(0.0),
                    const Color(0xff191a32).withOpacity(1.0)
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      search?.title ?? "",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${search?.year} ",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Text(
                      "${search?.type} ",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
