import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskapp/core/assets/assets.gen.dart';
import 'package:taskapp/core/services/routes/routes_names.dart';

class SNSplash extends StatefulWidget {
  const SNSplash({super.key});

  @override
  State<SNSplash> createState() => _SNSplashState();
}

class _SNSplashState extends State<SNSplash> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0.8, end: 1.1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // _animationController.forward();
    _animationController.repeat(reverse: true);

    Future.delayed(
      const Duration(seconds: 1),
      () {
        Navigator.pushNamedAndRemoveUntil(context, RoutesNames.products.viewProducts,(Route<dynamic> route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.icons.splashBackgroundImage.path,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.scale(
                scale: _animation.value,
                child: Center(
                  child: SvgPicture.asset(
                    Assets.icons.appLogoSvg.path,
                    width: 200,
                    height: 200,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
