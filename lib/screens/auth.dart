import 'package:bitsgap/res/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Stack(
        children: [
          Column(
            children: [
              ClipPath(
                clipper: const AuthScreenClipper(),
                child: Container(
                  height: 257,
                  color: colorScheme.secondary,
                ),
              ),
            ],
          ),
          Positioned(
            left: 24,
            top: 54,
            child: SvgPicture.asset(Images.logo),
          )
        ],
      ),
    );
  }
}

class AuthScreenClipper extends CustomClipper<Path> {
  const AuthScreenClipper();

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.6, size.height - 60);
    path.quadraticBezierTo(
      size.width * 0.8,
      size.height - 80,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
