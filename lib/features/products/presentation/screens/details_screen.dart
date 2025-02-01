import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazylevel/app/config/app_router.dart';
import 'package:lazylevel/app/config/app_theme.dart';
import 'package:lazylevel/core/utils/toast.dart';

class DetailsScreen extends StatefulWidget {
  final String id;
  const DetailsScreen({super.key, required this.id});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final url =
      "https://images.meesho.com/images/products/367648126/wgxv5_400.webp";

  int selectedIdx = 0;
  int selectedColorIdx = 0;
  int selectedSizeIdx = 0;
  bool isLiked = false;
  int qty = 0;

  List<Color> colors = [Colors.black, Colors.blue, Colors.deepPurple];
  List<String> sizes = ['S', 'M', 'L'];
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SingleChildScrollView(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            url,
                            height: mq.height * 0.55,
                            width: mq.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 30,
                        child: IconButton(
                          onPressed: () {
                            context.go('/main');
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: 30,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                          },
                          icon: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_outline,
                            size: 30,
                            color: isLiked
                                ? AppColor.secondaryColor
                                : Colors.black,
                          ),
                        ),
                      ),
                      // ✅ Thumbnails Positioned Vertically Below Image
                      Positioned(
                        bottom: 40, // Adjust as needed
                        left: 20, // Adjust alignment
                        child: Container(
                          height: 180, // ✅ Set fixed height for thumbnails
                          width: 60, // ✅ Set fixed width
                          decoration: BoxDecoration(
                            color: Color(0xfff0f0f0),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListView.builder(
                            itemCount: 3,
                            physics:
                                NeverScrollableScrollPhysics(), // Prevents scroll issues
                            itemBuilder: (ctx, idx) {
                              return AspectRatio(
                                aspectRatio: 1 / 1,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIdx = idx;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: idx == selectedIdx
                                          ? BorderRadius.circular(12)
                                          : null,
                                      border: idx == selectedIdx
                                          ? Border.all(
                                              color: AppColor.secondaryColor,
                                              width: 4)
                                          : null,
                                    ),
                                    margin: EdgeInsets.all(5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        url,
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  // description
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text("Cotton T-Shirt",
                          style: GoogleFonts.outfit(
                            textStyle: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "₹ 499.0",
                        style: GoogleFonts.outfit(
                          textStyle: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text("Colors",
                              style: GoogleFonts.outfit(
                                textStyle: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                        Row(
                          children: List.generate(
                              3,
                              (idx) => Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedColorIdx = idx;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: idx == selectedColorIdx
                                              ? Border.all(
                                                  color:
                                                      AppColor.secondaryColor,
                                                  width: 8,
                                                )
                                              : null,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: selectedColorIdx == idx
                                              ? EdgeInsets.all(5)
                                              : EdgeInsets.all(0),
                                          child: CircleAvatar(
                                            foregroundColor: colors[idx],
                                            backgroundColor: colors[idx],
                                            radius: selectedColorIdx == idx
                                                ? 15
                                                : 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text("Sizes",
                              style: GoogleFonts.outfit(
                                textStyle: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                        Row(
                          children: List.generate(
                            3,
                            (idx) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSizeIdx = idx;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: CircleAvatar(
                                  foregroundColor: idx != selectedSizeIdx
                                      ? Colors.black
                                      : Color(0xffc2c2c2),
                                  backgroundColor: idx == selectedSizeIdx
                                      ? Colors.black
                                      : Color(0xffc2c2c2),
                                  radius: 25,
                                  child: Center(
                                    child: Text(
                                      sizes[idx],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (qty < 20) {
                              qty++;
                            } else {
                              failureBar(context, "Maximum Ammount Reached");
                            }
                          });
                        },
                        child: CircleAvatar(
                          radius: 30,
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(qty.toString(),
                          style: GoogleFonts.outfit(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (qty > 0) {
                              qty--;
                            } else {
                              failureBar(
                                  context, "Quantity cannot be negative");
                            }
                          });
                        },
                        child: CircleAvatar(
                          radius: 30,
                          child: Center(
                            child: Icon(
                              Icons.remove,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  width: 180,
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColor.secondaryColor,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Center(
                      child: Text(
                    "Add to Cart",
                    style: GoogleFonts.outfit(
                        textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                  )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
