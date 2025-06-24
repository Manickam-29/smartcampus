
import 'package:flutter/material.dart';
import 'package:smartcampus/common/widgets/devicesize.dart';
import 'package:smartcampus/common/widgets/splashcardswiper.dart';
import 'package:smartcampus/constants/colors.dart';
import 'package:smartcampus/services/sboperations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double h = 0.0, w = 0.0;

  @override
  void initState() {
    super.initState();

    SBOperations().retrieveAppImagesFromSB();
  }

  @override
  Widget build(BuildContext context) {
    h = Devicesize().getDeviceHeight(context);
    w = Devicesize().getDeviceWidth(context);
    return Scaffold(
      backgroundColor: lightGrayishBlue,
      body: SafeArea(
        child: SplashCardSwiper(w: w * 0.8, h: h * 0.8),
      ),
    );
  }
}
