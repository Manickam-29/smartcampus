import 'package:flutter/material.dart';
import 'package:smartcampus/common/utils/functions.dart';
import 'package:smartcampus/common/widgets/buttons.dart';
import 'package:smartcampus/common/widgets/devicesize.dart';
import 'package:smartcampus/common/widgets/padding.dart';
import 'package:smartcampus/constants/colors.dart';
import 'package:smartcampus/constants/texts.dart';
import 'package:smartcampus/features/auth/loginactions.dart';

void showLoginSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    backgroundColor: lightGrayishBlue, // Make modal background transparent
    barrierColor: Colors.transparent, // Remove the dark overlay entirely
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: _LoginForm(), // Wrap in container for styling
      );
    },
  );
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  TextEditingController idController = TextEditingController(text: 'T001');
  TextEditingController passController = TextEditingController(
    text: 'test@001',
  );
  bool _obscurePassword = true;
  double h = 0.0, w = 0.0;
  @override
  Widget build(BuildContext context) {
    h = Devicesize().getDeviceHeight(context);
    w = Devicesize().getDeviceWidth(context);
    return Container(
      height: h * 0.5,
      padding: EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonPadding.topPadding24,
            Text(
              '${Functions().capitalizeFirstLetter(selectedUser)} Login',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            CommonPadding.topPadding24,
            TextField(
              controller: idController,
              decoration: InputDecoration(
                labelText:
                    '${Functions().capitalizeFirstLetter(selectedUser)} ID',
                prefixIcon: Icon(Icons.person),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.teal),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.teal, width: 2),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            CommonPadding.topPadding24,
            TextField(
              controller: passController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.teal),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.teal, width: 2),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            CommonPadding.topPadding32,
            Buttons().circularElevatedButton(
              height: h * 0.05,
              width: w * 0.75,
              onPressed:
                  idController.text.isEmpty || passController.text.isEmpty
                  ? null
                  : () {
                      if (selectedUser == 'teacher') {
                        LoginActions().loginButtonActionForTeacher(
                          context,
                          idController.text,
                          passController.text,
                        );
                      } else {
                        LoginActions().loginButtonActionForStudent(
                          context,
                          idController.text,
                          passController.text,
                        );
                      }
                    },
              buttonBG: teal,
              buttonText: "Login",
              buttonTextColor: white,
              buttonTextSize: 24,
            ),
          ],
        ),
      ),
    );
  }
}
