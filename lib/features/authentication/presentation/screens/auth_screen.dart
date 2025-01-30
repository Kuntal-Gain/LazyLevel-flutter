import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazylevel/app/config/app_router.dart';
import 'package:lazylevel/app/config/app_theme.dart';
import 'package:lazylevel/features/authentication/presentation/widgets/input_tile.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _usernameController;
  bool obscureText = true;
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/logo.png',
            width: mq.width * 0.5,
            height: mq.height * 0.2,
          ),
          inputTile(
            controller: _usernameController,
            hintText: "Username",
            mq: mq,
          ),
          inputTile(
            controller: _emailController,
            hintText: "Email",
            mq: mq,
          ),
          inputPassTile(
            controller: _passwordController,
            hintText: "Password",
            mq: mq,
            obscureText: obscureText,
            showPassword: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
          GestureDetector(
            onTap: () {
              context.go('/main');
            },
            child: Container(
              height: mq.height * 0.08,
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: AppColor.secondaryColor,
              ),
              child: Center(
                child: Text(
                  isLogin ? "Login" : "Create Account",
                  style: GoogleFonts.outfit(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isLogin = !isLogin;
              });
            },
            child: Center(
              child: RichText(
                  text: TextSpan(
                text: isLogin
                    ? "Don't Have an Account ? "
                    : "Already have an account? ",
                style: GoogleFonts.outfit(
                  fontSize: 16,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: isLogin ? "Create" : "Login",
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.secondaryColor,
                    ),
                  ),
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}
