import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazylevel/app/config/app_router.dart';
import 'package:lazylevel/features/products/presentation/widgets/product_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/icons/user.png'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good Morning",
                            style: GoogleFonts.merienda(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text("Username",
                              style: GoogleFonts.outfit(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              )),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          'assets/icons/shopping-bag.png',
                          height: 40,
                          width: 40,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(99.toString(),
                                style: GoogleFonts.merienda(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Find the best fit for all your needs!',
                  style: GoogleFonts.quicksand(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  shrinkWrap:
                      true, // This allows MasonryGridView to be inside a scrollable parent
                  physics:
                      NeverScrollableScrollPhysics(), // Disables inner scrolling
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
