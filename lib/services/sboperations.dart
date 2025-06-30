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

      list.add({Functions().removeTypeFromName(file.name): publicUrl});
      list.add({Functions().removeTypeFromName(file.name): publicUrl});
    }

    inAppImages = list;
    onCall();
  }

  Future<void> getAllTeacherBasicDetails(VoidCallback onCall) async {
    final data = await supabase.from('teachers_basic_details').select();
    teacherBasicDetails = data;
    onCall();
  }

  Future<void> getAllTeacherProfessionalDetails(VoidCallback onCall) async {
    final data = await supabase.from('teachers_professional_details').select();
    teachersProfessionalDetails = data;
    onCall();
  }

  Future<void> getAllStudentsBasicDetails(VoidCallback onCall) async {
    final data = await supabase.from('students_basic_details').select();
    studentsBasicDetails = data;
    onCall();
  }

  Future<void> getAllStudentsSchoolDetails(VoidCallback onCall) async {
    final data = await supabase.from('students_school_info').select();
    studentsSchoolDetails = data;
    onCall();
  }

  Future<void> getAllSchoolEventsDetails(VoidCallback onCall) async {
    final data = await supabase.from('school_events').select();
    schoolEventsDetails = data;
    onCall();
  }

  Future<void> getGrade1ClassSchedule(VoidCallback onCall) async {
    final data = await supabase.from('grade_1_periods').select();
    grade1Schedule = data;
    onCall();
  }

  Future<void> getGrade2ClassSchedule(VoidCallback onCall) async {
    final data = await supabase.from('grade_2_periods').select();
    grade2Schedule = data;
    onCall();
  }

  Future<void> getGrade3ClassSchedule(VoidCallback onCall) async {
    final data = await supabase.from('grade_3_periods').select();
    grade3Schedule = data;
    onCall();
  }

  Future<void> getGrade4ClassSchedule(VoidCallback onCall) async {
    final data = await supabase.from('grade_4_periods').select();
    grade4Schedule = data;
    onCall();
  }

  Future<void> getGrade5ClassSchedule(VoidCallback onCall) async {
    final data = await supabase.from('grade_5_periods').select();
    grade5Schedule = data;
    onCall();
  }

  Future<Map<String, dynamic>?> retrieveCurrentTeacher(String teacherId) async {
    final List<Map<String, dynamic>> basic = await supabase
        .from('teachers_basic_details')
        .select()
        .eq('teacher_id', teacherId);
    final List<Map<String, dynamic>> professional = await supabase
        .from('teachers_professional_details')
        .select()
        .eq('teacher_id', teacherId);

    final Map<String, dynamic> result = Functions().combineTwoMapData(
      basic[0],
      professional[0],
    );

    return result;
  }
}
