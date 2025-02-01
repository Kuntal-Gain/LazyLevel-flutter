import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lazylevel/app/config/app_router.dart';
import 'package:lazylevel/app/config/app_theme.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // Profile Header
          Container(
            color: AppColor.secondaryColor,
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile Picture
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1599566150163-29194dcaad36',
                  ),
                ),
                const SizedBox(height: 10),
                // User Name
                const Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                // Email or other info
                const Text(
                  'john.doe@example.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Option: Edit Profile
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Edit Profile'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Edit Profile Screen
              context.go('/edit-profile');
            },
          ),
          const Divider(height: 1),
          // Option: My Addresses

          const Divider(height: 1),
          // Option: My Orders
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('My Orders'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Orders Screen
            },
          ),
          const Divider(height: 1),
          // Option: Wishlist
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Wishlist'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Wishlist Screen
            },
          ),
          const Divider(height: 1),
          // Option: Payment Methods
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Payment Methods'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Payment Methods Screen
            },
          ),
          const Divider(height: 1),
          // Option: Settings
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Settings Screen
            },
          ),
          const Divider(height: 1),
          // Option: Help & Support
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help & Support'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Help & Support Screen
            },
          ),
          const Divider(height: 1),
          // Option: Logout
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Handle user logout
            },
          ),
          const Divider(height: 1),
        ],
      ),
    );
  }
}
