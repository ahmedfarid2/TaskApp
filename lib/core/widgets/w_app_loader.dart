import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WAppLoader extends StatelessWidget {
  const WAppLoader({super.key, this.size});
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.asset(
        'assets/animations/jd_app_loder.json',
        width: size,
        height: size,
      ),
    );
  }
}
