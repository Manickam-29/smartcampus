import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:smartcampus/common/utils/functions.dart';
import 'package:smartcampus/constants/lists.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SBOperations {
  final SupabaseClient supabase = Supabase.instance.client;

  // Retrieve all images for app
  Future<void> retrieveAppImagesFromSB(VoidCallback onCall) async {
    List<Map<String, dynamic>> list = [];
    final List<FileObject> files = await supabase.storage.from('images').list();

    for (var file in files) {
      final String publicUrl = supabase.storage
          .from('images')
          .getPublicUrl(file.name);

      list.add({Functions().removeTypeFromName(file.name, '.jpg'): publicUrl});
    }

    splashImages = list;

    onCall();
  }

  Future<void> getAllTeacherBasicDetails(VoidCallback onCall) async {
    final data = await supabase.from('teachers_basic_details').select();
    teacherBasicDetails = data;
    log("Teacher Basic Details : $teacherBasicDetails");
    onCall();
  }

  Future<void> getAllTeacherProfessionalDetails(VoidCallback onCall) async {
    final data = await supabase.from('teachers_professional_details').select();
    teachersProfessionalDetails = data;
    log("Teacher Professional Details : $teachersProfessionalDetails");
    onCall();
  }

  Future<void> getAllStudentsBasicDetails(VoidCallback onCall) async {
    final data = await supabase.from('students_basic_details').select();
    studentsBasicDetails = data;
    log("Students Basic Details : $studentsBasicDetails");
    onCall();
  }

  Future<void> getAllStudentsSchoolDetails(VoidCallback onCall) async {
    final data = await supabase.from('students_school_info').select();
    studentsSchoolDetails = data;
    log("Students School Details : $studentsSchoolDetails");
    onCall();
  }
}
