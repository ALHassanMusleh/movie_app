import 'package:flutter/material.dart';
import 'package:movie_app/ui/utils/app_colors.dart';
import 'package:movie_app/ui/utils/widgets/custom_movie_header.dart';
import 'package:movie_app/ui/utils/widgets/image_and_bookmark_large.dart';
import 'package:movie_app/ui/utils/widgets/image_and_bookmark_small.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});
  static const String routeName = 'MovieDetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dora and the lost city of gold'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              children: [
                const CustomMovieCover(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Dora and the lost city of gold',
                            style: TextStyle(
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '2019  PG-13  2h 7m',
                            style: TextStyle(
                              color: AppColors.white.withOpacity(.53),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Expanded(
                                flex: 4, child: ImageAndBookmarkLarge()),
                            Expanded(
                              flex: 6,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                            color: AppColors.white
                                                .withOpacity(0.5),
                                            width: 1,
                                          ),
                                        ),
                                        child: Text(
                                          'Action',
                                          style: TextStyle(
                                            color: AppColors.white
                                                .withOpacity(0.6),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              color: AppColors.white
                                                  .withOpacity(0.5),
                                              width: 1),
                                        ),
                                        child: Text(
                                          'Action',
                                          style: TextStyle(
                                            color: AppColors.white
                                                .withOpacity(0.6),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              color: AppColors.white
                                                  .withOpacity(0.5),
                                              width: 1),
                                        ),
                                        child: Text(
                                          'Action',
                                          style: TextStyle(
                                            color: AppColors.white
                                                .withOpacity(0.6),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'sdgdsgsdgsdgsdgsdgsdgsdfhfdhfdhfdhfdhfdhfdhdgsdgsdgdssdgdsgsdgsdgsdgsdgsdgsdfhfdhfdhfdhfdhfdhfdhdgsdgsdgdssdgdsgsdgsdgsdgsdgsdgsdfhfdhfdhfdhfdhfdhfdhdgsdgsdgdssdgdsgsdgsdgsdgsdgsdgsdfhfdhfdhfdhfdhfdhfdhdgsdgsdgds',
                                    style: TextStyle(
                                      color: Color(0xffbacCBCBCB),
                                    ),
                                    maxLines: 6,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: AppColors.primary,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '7.7',
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height * .3,
              width: double.infinity,
              color: AppColors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recomended',
                    style: TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                            width: MediaQuery.of(context).size.width * .23,
                            height: MediaQuery.of(context).size.height * .2,
                            decoration: BoxDecoration(
                              color: const Color(0xff343534),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Column(
                              children: [
                                const ImageAndBookmarkSmall(),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: AppColors.primary,
                                            size: 12,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            '7.7',
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        'Deadpool 2',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '2018  R  1h 59m',
                                        style: TextStyle(
                                          color:
                                              AppColors.white.withOpacity(.53),
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
