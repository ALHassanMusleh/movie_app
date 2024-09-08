import 'package:flutter/material.dart';
import 'package:movie_app/data/api/api_manager.dart';
import 'package:movie_app/ui/utils/app_colors.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    ApiManager.searchMovie('ab');
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40,bottom: 20,left: 20,right: 20),
          child: const TextField(
            style:
                TextStyle(color: Colors.white, backgroundColor: AppColors.grey),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.grey,
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.white,
              ),
              hintText: 'Search',
              hintStyle: TextStyle(
                color: AppColors.white,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    25,
                  ),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    25,
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    25,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),

            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/bg_3.png',
                        width: MediaQuery.of(context).size.width * .33,
                        height: MediaQuery.of(context).size.height * .1,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Alita Battle Angel',
                            style: TextStyle(color: AppColors.white),
                          ),
                          Text(
                            '2019',
                            style: TextStyle(
                              color: AppColors.white.withOpacity(.53),
                            ),
                          ),
                          Text(
                            'Rosa Salazar, Christoph Waltz',
                            style: TextStyle(
                              color: AppColors.white.withOpacity(.53),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context,index){
                return Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width *.9,
                  color: Color(0xff707070),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
