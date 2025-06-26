import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:smartcampus/common/utils/functions.dart';
import 'package:smartcampus/common/widgets/buttons.dart';
import 'package:smartcampus/common/widgets/images.dart';
import 'package:smartcampus/common/widgets/padding.dart';
import 'package:smartcampus/constants/colors.dart';
import 'package:smartcampus/constants/lists.dart';

class SplashCardSwiper extends StatelessWidget {
  final double w;
  final double h;
  final void Function(String, String) onpressed;

  const SplashCardSwiper({
    super.key,
    required this.w,
    required this.h,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        String buttonName = whoAreYou[index];
        final imageUrl = Functions().getImageUrlUsingKey(buttonName);

        return Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CommonPadding.topPadding24,
              Text(
                "Who are You?",
                style: TextStyle(
                  fontSize: 32,
                  color: tealBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              imageUrl != null && imageUrl.isNotEmpty
                  ? Images().networkImageByPath(imageUrl, h * 0.7, w * 0.7)
                  : Icon(Icons.broken_image, size: h * 0.5, color: Colors.grey),
              Buttons().circularElevatedButton(
                height: h * 0.08,
                width: w * 0.75,
                onPressed: () {
                  onpressed(buttonName, imageUrl!);
                },
                buttonBG: tealBlue,
                buttonText:
                    "I'm ${Functions().capitalizeFirstLetter(buttonName)}",
                buttonTextColor: white,
                buttonTextSize: 24,
              ),
            ],
          ),
        );
      },
      itemCount: whoAreYou.length,
      itemWidth: w,
      itemHeight: h,
      layout: SwiperLayout.STACK,
    );
  }
}
