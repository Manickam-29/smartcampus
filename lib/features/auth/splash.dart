import 'package:flutter/material.dart';
import 'package:smartcampus/common/utils/navigationsutils.dart';
import 'package:smartcampus/common/widgets/devicesize.dart';
import 'package:smartcampus/common/widgets/loadingscreen.dart';
import 'package:smartcampus/common/widgets/splashcardswiper.dart';
import 'package:smartcampus/constants/colors.dart';
import 'package:smartcampus/constants/texts.dart';
import 'package:smartcampus/services/sboperations.dart';
import '../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double h = 0.0, w = 0.0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    SBOperations().retrieveAppImagesFromSB(() {
      setState(() {});
    });
    SBOperations().getAllTeacherBasicDetails(() {
      setState(() {});
    });
    SBOperations().getAllTeacherProfessionalDetails(() {
      setState(() {});
    });
    SBOperations().getAllStudentsBasicDetails(() {
      setState(() {});
    });
    SBOperations().getAllStudentsSchoolDetails(() {
      setState(() {});
    });
    SBOperations().getAllSchoolEventsDetails(() {
      setState(() {});
    });

    setLoadingOff();
  }

  void setLoadingOff() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    h = Devicesize().getDeviceHeight(context);
    w = Devicesize().getDeviceWidth(context);
    return Scaffold(
      backgroundColor: lightGrayishBlue,
      body: SafeArea(
        child: isLoading
            ? LoadingScreen()
            : SplashCardSwiper(
                w: w * 0.8,
                h: h * 0.8,
                onpressed: (name, url) {
                  setState(() {
                    selectedUser = name;
                    selectedUserImage = url;
                  });

                  NavigationsUtils().pushNameNavigation(
                    context,
                    AppRoutes.login,
                  );
                },
              ),
      ),
    );
  }
}
