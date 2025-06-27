import 'package:flutter/material.dart';
import 'package:smartcampus/common/widgets/devicesize.dart';
import 'package:smartcampus/common/widgets/padding.dart';
import '../../common/utils/functions.dart';
import '../../common/widgets/images.dart';
import '../../common/widgets/loadingscreen.dart';
import '../../constants/colors.dart';
import '../../constants/maps.dart';
import '../bottomsheets/myprofilebs.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isLoading = true;
  double h = 0.0, w = 0.0;
  String imageUrl = '';

  @override
  void initState() {
    super.initState();

    _loadTeacherData();
  }

  Future<void> _loadTeacherData() async {
    // Wait until data is ready
    while (selectedCurrentTeacher.isEmpty ||
        selectedCurrentTeacher['first_name'] == null ||
        selectedCurrentTeacher['gender'] == null) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    // Load image based on gender
    final gender = selectedCurrentTeacher['gender'].toString().toLowerCase();
    final key = gender == 'male' ? 'teacher_male' : 'teacher_female';
    final url = Functions().getImageUrlUsingKey(key);

    imageUrl = (url != null && url.isNotEmpty)
        ? url
        : 'https://example.com/default_teacher.png';

    if (mounted) {
      setState(() => isLoading = false);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        showProfileSheet(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = Devicesize().getDeviceHeight(context);
    double w = Devicesize().getDeviceWidth(context);
    return Scaffold(
      backgroundColor: skyBlue,
      body: SafeArea(
        child: isLoading
            ? const LoadingScreen()
            : Center(
              child: Column(
                  children: [
                    Text(
                      'My Profile',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                    CommonPadding.topPadding24,
                    CircleAvatar(
                      radius: w * 0.15,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Images().networkImageByPath(
                          imageUrl,
                          h * 0.2,
                          w * 0.2,
                        ),
                      ),
                    ),
                    CommonPadding.leftPadding24,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${selectedCurrentTeacher['first_name']} ${selectedCurrentTeacher['last_name']}, ${selectedCurrentTeacher['qualification']}',
                            style: const TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            selectedCurrentTeacher['specialization'] ?? '',
                            style: const TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ),
      ),
    );
  }
}
