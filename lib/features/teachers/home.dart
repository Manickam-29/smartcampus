import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smartcampus/common/widgets/devicesize.dart';
import 'package:smartcampus/common/widgets/images.dart';
import 'package:smartcampus/common/widgets/loadingscreen.dart';
import 'package:smartcampus/common/widgets/padding.dart';
import 'package:smartcampus/constants/colors.dart';
import 'package:smartcampus/constants/maps.dart';
import 'package:smartcampus/routes/app_routes.dart';
import '../../common/utils/functions.dart';
import '../../common/widgets/bottomsheets/homebs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String imageUrl = '';
  bool isLoading = true;

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

      // Show bottom sheet after UI frame is built
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showHomeBottomSheet(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = Devicesize().getDeviceHeight(context);
    final w = Devicesize().getDeviceWidth(context);

    return Scaffold(
      backgroundColor: skyBlue,
      body: SafeArea(
        child: isLoading
            ? const LoadingScreen()
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonPadding.leftPadding24,
                        CircleAvatar(
                          radius: w * 0.08,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: Images().networkImageByPath(
                              imageUrl,
                              h * 0.125,
                              w * 0.125,
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
                        IconButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.home,
                            );
                          },
                          icon: Icon(
                            MdiIcons.lockReset,
                            color: white,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
