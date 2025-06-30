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
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    try {
      await SBOperations().retrieveAppImagesFromSB(() {
        setState(() {});
      });

      await SBOperations().getAllTeacherBasicDetails(() {
        setState(() {});
      });

      await SBOperations().getAllTeacherProfessionalDetails(() {
        setState(() {});
      });

      await SBOperations().getAllStudentsBasicDetails(() {
        setState(() {});
      });

      await SBOperations().getAllStudentsSchoolDetails(() {
        setState(() {});
      });

      await SBOperations().getAllSchoolEventsDetails(() {
        setState(() {});
      });

      await Future.wait([
        SBOperations().getGrade1ClassSchedule(() => setState(() {})),
        SBOperations().getGrade2ClassSchedule(() => setState(() {})),
        SBOperations().getGrade3ClassSchedule(() => setState(() {})),
        SBOperations().getGrade4ClassSchedule(() => setState(() {})),
        SBOperations().getGrade5ClassSchedule(() => setState(() {})),
      ]);
    } catch (e) {
      // Optional: Show error UI or log
      debugPrint('Error while loading splash data: $e');
    }

    // Delay for better UX (optional)
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      isLoading = false;
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
            ? const LoadingScreen()
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
