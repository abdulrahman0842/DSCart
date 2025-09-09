import 'package:ds_cart/service/auth_service.dart';
import 'package:ds_cart/view/home_screen.dart';
import 'package:ds_cart/view/register_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeTransition;
  late Animation<Offset> _slideTransition;
  @override
  void initState() {
    super.initState();
    _animate();
  }

  void _animate() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _slideTransition = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _fadeTransition = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _checkLoginAndNavigate();
    _controller.forward();
  }

  void _checkLoginAndNavigate() async {
    final bool isLoggedIn = await AuthService.isLoggedIn();

    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (_) => isLoggedIn ? HomeScreen() : RegisterScreen()));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeTransition(
          opacity: _fadeTransition,
          child: SlideTransition(
            position: _slideTransition,
            child: Text(
              "DS Cart",
              style: TextStyle(
                  fontSize: 60,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
          ),
        )
      ],
    )));
  }
}
