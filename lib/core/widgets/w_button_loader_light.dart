import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WButtonLoaderLight extends StatelessWidget {
  const WButtonLoaderLight({super.key, this.size});

  final double? size;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 2,
      child: Lottie.asset(
        'assets/animations/button_loader_light.json',
        width: size,
        height: size,
      ),
    );
  }
}
