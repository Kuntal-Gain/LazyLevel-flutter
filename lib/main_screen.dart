import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lazylevel/app/config/app_theme.dart';
import 'package:lazylevel/features/authentication/presentation/screens/user_screen.dart';
import 'package:lazylevel/features/products/presentation/screens/home_screen.dart';
import 'package:lazylevel/features/products/presentation/screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Replace with your own image paths
  final List<String> _iconPaths = [
    'assets/icons/home.png',
    'assets/icons/search.png',
    'assets/icons/heart.png',
    'assets/icons/user.png',
  ];

  final List<String> _selectedIconPaths = [
    'assets/icons/home_selected.png',
    'assets/icons/search_selected.png',
    'assets/icons/heart_selected.png',
    'assets/icons/user_selected.png',
  ];

  final List<String> _labels = ['Home', 'Search', 'Likes', 'User'];

  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    Container(
      child: Center(
        child: Text('Likes'),
      ),
    ),
    UserScreen(),
  ];

  Widget _buildNavItem(int index) {
    bool isSelected = index == _selectedIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Expanded(
        child: Container(
          child: Column(
            children: [
              // Icon
              Image.asset(
                isSelected ? _selectedIconPaths[index] : _iconPaths[index],
                width: 28.0, // Icon size
                height: 28.0, // Icon size
              ),

              // Text label
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  _labels[index],
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: isSelected
                        ? AppColor.secondaryColor
                        : Colors.black54, // Text color
                  ),
                ),
              ),

              // // Line indicator for selected icon
              // if (isSelected)
              //   Container(
              //     margin: const EdgeInsets.only(top: 4.0),
              //     width: 50.0, // Same width as the icon
              //     height: 2.0,
              //     color: AppColor.secondaryColor, // Selected color
              //   ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomAppBar(
          height: 80,
          color: Colors.white,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(_iconPaths.length, (index) {
                return _buildNavItem(index);
              }),
            ),
          ),
        ));
  }
}
