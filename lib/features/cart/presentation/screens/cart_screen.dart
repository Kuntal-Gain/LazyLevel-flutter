import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazylevel/features/cart/presentation/widgets/text_tile.dart';

import '../../../../app/config/app_theme.dart';
import '../../../../core/utils/toast.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<String> images = [
    'https://images.meesho.com/images/products/367648126/wgxv5_400.webp',
    'https://images.meesho.com/images/products/424112880/wwrsd_400.webp',
    'https://images.meesho.com/images/products/406017874/p84lj_400.webp',
    'https://crazymonk.in/cdn/shop/files/Naruto-Ninetails-1.jpg?v=1714154691&width=360',
  ];

  int qty = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // shadowColor: Colors.white,
        backgroundColor: Colors.white,
        // foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () => context.go('/main'),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 25,
          ),
        ),
        centerTitle: true,
        title: Text(
          'My Cart',
          style: GoogleFonts.outfit(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // List of cart items
            ListView.builder(
              shrinkWrap: true, // Important to wrap the content
              physics:
                  const NeverScrollableScrollPhysics(), // Disable inner scrolling
              itemBuilder: (ctx, idx) {
                return Container(
                  margin: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.network(
                              images[idx],
                              height: 120,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Product Name',
                                style: GoogleFonts.outfit(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10),
                                child: Text(
                                  '\$100',
                                  style: GoogleFonts.outfit(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (qty < 20) {
                                          qty++;
                                        } else {
                                          failureBar(context,
                                              "Maximum Ammount Reached");
                                        }
                                      });
                                    },
                                    child: const CircleAvatar(
                                      radius: 15,
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Text(
                                    qty.toString(),
                                    style: GoogleFonts.outfit(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (qty > 0) {
                                          qty--;
                                        } else {
                                          failureBar(context,
                                              "Quantity cannot be negative");
                                        }
                                      });
                                    },
                                    child: const CircleAvatar(
                                      radius: 15,
                                      child: Center(
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: const Color(0xff24232B),
                            child: Center(
                              child: Text(
                                'S',
                                style: GoogleFonts.outfit(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: AppColor.secondaryColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: images.length,
            ),
            // Divider between list and price summary
            const Padding(
              padding: EdgeInsets.all(12),
              child: Divider(),
            ),
            // Price summary tiles
            priceTile(label: "Sub Total", val: 84.00),
            priceTile(label: "Shipping", val: 6.00),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bag Total',
                    style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    '\$90.00',
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        color: AppColor.secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Checkout button
            Container(
              height: 75,
              width: double.infinity,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "Proceed to Checkout",
                  style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
