import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}


class _BrowseTabState extends State<BrowseTab> {
  List<String> categoriesList = [];
  bool isLoading = true;
  void initState(){
    buildCategoriesList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(flex: 8,),
              Text('Browse Category ',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w400),),
              Spacer(flex: 2,),
              isLoading
                  ? Expanded(flex: 90,child: const Center(child: CircularProgressIndicator()))  // Show loading indicator
                  : Expanded(
                flex: 85,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,  // 2 items per row
                      crossAxisSpacing: 32,
                      mainAxisSpacing: 32,
                      childAspectRatio: 16 / 9,  // Aspect ratio for the image tiles
                    ),
                    itemCount: categoriesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CategoryTile(
                        category: categoriesList[index],
                        imagePath: 'assets/images/${categoriesList[index]}.jpg', // Replace with real image URL
                      );
                    },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void buildCategoriesList() async{
    try {
      Response response = await get(
          Uri.parse('https://api.themoviedb.org/3/genre/movie/list?language=en&api_key=5c1677c3d590a0da02b950bde3d80151'));
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      List<String> data = (responseBody['genres'] as List)
          .map((genre) => genre['name'].toString())
          .toList();

      setState(() {
        categoriesList = data;
        isLoading = false;  // Update loading state
        print(categoriesList);
      });
      print(categoriesList);
    } catch (e) {
      print("Error fetching categories: $e");
    }
  }
}
class CategoryTile extends StatelessWidget {
  final String category;
  final String imagePath;

  const CategoryTile({required this.category, required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,  // Cover the entire tile
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black.withOpacity(0.4),  // Semi-transparent overlay
          ),
          alignment: Alignment.center,
          child: Text(
            category,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}


