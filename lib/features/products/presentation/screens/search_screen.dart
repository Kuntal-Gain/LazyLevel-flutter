import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazylevel/app/config/app_theme.dart';

import '../widgets/product_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> categories = [
    'Casual',
    'Weeb',
    'Techy',
    'Cyberpunk',
  ];

  List<TextStyle> styles = [
    GoogleFonts.poppins(fontSize: 30), // Casual
    GoogleFonts.kalam(fontSize: 30), // Weeb (Anime-style font)
    GoogleFonts.pressStart2p(fontSize: 30), // Techy
    GoogleFonts.orbitron(fontSize: 30), // Cyberpunk (Futuristic look)
  ];

  List<String> images = [
    'https://images.meesho.com/images/products/367648126/wgxv5_400.webp',
    'https://images.meesho.com/images/products/424112880/wwrsd_400.webp',
    'https://images.meesho.com/images/products/406017874/p84lj_400.webp',
    'https://crazymonk.in/cdn/shop/files/Naruto-Ninetails-1.jpg?v=1714154691&width=360',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Container(
                height: 60,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xffe8e8e8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for products',
                      hintStyle: GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade400,
                      ),
                      suffixIcon: Image.asset(
                        'assets/icons/sliders.png',
                        height: 33,
                      ),
                      border: InputBorder.none,
                      icon: Image.asset(
                        'assets/icons/search.png',
                        height: 33,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: categories.length,
                shrinkWrap:
                    true, // Allow it to size within SingleChildScrollView
                physics:
                    NeverScrollableScrollPhysics(), // Prevents inner scrolling
                itemBuilder: (ctx, idx) {
                  return Container(
                    height: 150,
                    width: 150,
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: (idx == 0 || idx == 3)
                          ? AppColor.primaryColor
                          : AppColor.secondaryColor,
                      border: Border.all(color: Color(0xffc2c2c2)),
                    ),
                    child: Center(
                      child: Text(
                        categories[idx],
                        style: styles[idx].copyWith(
                          color: (idx == 0 || idx == 3)
                              ? Colors.black
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16),
                child: Text(
                  'Products',
                  style: GoogleFonts.outfit(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  shrinkWrap:
                      true, // Allows MasonryGridView to fit inside Column
                  physics:
                      NeverScrollableScrollPhysics(), // Prevents nested scrolling
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.go('/details/${1234}');
                      },
                      child: productTile(images[index]),
                    );
                  },
                  itemCount: images.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
