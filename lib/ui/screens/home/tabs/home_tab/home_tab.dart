import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/ui/utils/app_colors.dart';
import 'package:movie_app/ui/utils/widgets/custom_movie_header.dart';
import 'package:movie_app/ui/utils/widgets/image_and_bookmark_large.dart';
import 'package:movie_app/ui/utils/widgets/image_and_bookmark_small.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          buildTopPopular(),
          const SizedBox(
            height: 20,
          ),
          buildNewReleases(),
          const SizedBox(
            height: 30,
          ),
          buildRecomended(),
        ],
      ),
    );
  }

  buildTopPopular() => CarouselSlider(
        items: [
          movieFullHeader(),
          movieFullHeader(),
        ],
        options: CarouselOptions(
          height: 250,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(
            seconds: 3,
          ),
          autoPlayAnimationDuration: const Duration(
            seconds: 1,
          ),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
          viewportFraction: 1, //عشان الصورة تاخذ كل العرض
        ),
      );

  buildNewReleases() => Container(
        padding: EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height * .2,
        width: double.infinity,
        color: AppColors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Releases ',
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ImageAndBookmarkSmall();
                  }),
            ),
          ],
        ),
      );

  buildRecomended() => Container(
        padding: EdgeInsets.all(15),
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
                        color: Color(0xff343534),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        children: [
                          ImageAndBookmarkSmall(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: AppColors.primary,
                                      size: 12,
                                    ),
                                    const SizedBox(
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
                                Text(
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
                                    color: AppColors.white.withOpacity(.53),
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
      );

  movieFullHeader() => InkWell(
    onTap: (){

    },
    child: Container(
          height: MediaQuery.of(context).size.height * .32,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CustomMovieCover(context: context),
              Positioned(
                top: 75,
                left: 10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ImageAndBookmarkLarge(),
                    const SizedBox(
                      width: 10,
                    ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
  );
}
