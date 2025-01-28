import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500), // Slower animation
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -0.5), // More pronounced movement
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void _handleSwipeUp() async {
    await HapticFeedback.mediumImpact();
    if (mounted) {
      context.go('/auth');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return FadeTransition(
          opacity: Tween<double>(begin: 0.6, end: 1.0).animate(_controller),
          child: GestureDetector(
            onVerticalDragEnd: (details) {
              if (details.primaryVelocity! < 0) {
                _handleSwipeUp();
              }
            },
            child: Scaffold(
              body: Stack(
                children: [
                  // level 0
                  Image.asset(
                    'assets/sp.png',
                    height: mq.height,
                    fit: BoxFit.cover,
                  ),

                  // level 1
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: -250,
                    child: CircleAvatar(
                      radius: 250,
                      backgroundColor: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              Color(0xffee653d),
                              Color(0xffee653d).withOpacity(0.7),
                              Color(0xffee653d).withOpacity(0.3),
                              Colors.transparent,
                            ],
                            stops: [0.2, 0.5, 0.7, 1.0],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffee653d),
                              blurRadius: 50,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // level 2
                  Positioned(
                    bottom: 220,
                    left: 70,
                    child: Text(
                      "LIVE YOUR \nPERFECT",
                      style: GoogleFonts.outfit(
                        textStyle: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.2, // Added this line to reduce line spacing
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // level 3
                  Positioned(
                    bottom: 170,
                    left: 100,
                    child: Text(
                      "Smart , Gorgeous & Fasionable \ncollection makes you cool",
                      style: GoogleFonts.outfit(
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          height: 1.2, // Added this line to reduce line spacing
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // level 4
                  Positioned(
                    bottom: 50,
                    left: 0,
                    right: 0,
                    child: Container(
                      child: Column(
                        children: [
                          SlideTransition(
                            position: _animation,
                            child: const Icon(
                              Icons.keyboard_double_arrow_up,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                          Text(
                            "Swipe up to Start",
                            style: GoogleFonts.outfit(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
