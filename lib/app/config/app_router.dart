import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:lazylevel/features/authentication/presentation/screens/edit_profile_screen.dart';
import 'package:lazylevel/main_screen.dart';

import '../../features/authentication/presentation/screens/auth_screen.dart';
import '../../features/authentication/presentation/screens/splash_screen.dart';
import '../../features/cart/presentation/screens/cart_screen.dart';
import '../../features/checkout/presentation/screens/checkout_screen.dart';
import '../../features/products/presentation/screens/details_screen.dart';
import '../../features/products/presentation/screens/home_screen.dart';
import '../../features/products/presentation/screens/search_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      // Auth
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/auth',
        name: 'auth',
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: '/edit-profile',
        name: 'edit profile',
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: '/orders',
        name: 'orders',
        builder: (context, state) => const AuthScreen(),
      ),

      // Products
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/search',
        name: 'search',
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: '/details/:id',
        name: 'details',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return DetailsScreen(id: id);
        },
      ),

      // cart
      GoRoute(
        path: '/cart',
        name: 'cart',
        builder: (context, state) => const CartScreen(),
      ),

      // checkout
      GoRoute(
        path: '/checkout',
        name: 'checkout',
        builder: (context, state) => const CheckoutScreen(),
      ),

      GoRoute(
        path: '/main',
        name: 'main',
        builder: (context, state) => MainScreen(),
      )
    ],
  );
}
