import 'package:flutter/material.dart';
import 'package:smartcampus/common/widgets/devicesize.dart';
import 'package:smartcampus/common/widgets/images.dart';
import 'package:smartcampus/constants/colors.dart';
import 'package:smartcampus/constants/texts.dart';
import '../bottomsheets/loginbs.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double h = 0.0;
  double w = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showLoginSheet(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    h = Devicesize().getDeviceHeight(context);
    w = Devicesize().getDeviceWidth(context);
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Images().networkImageByPath(
                selectedUserImage,
                h * 0.5,
                w * 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
