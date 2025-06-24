import 'package:smartcampus/common/utils/functions.dart';
import 'package:smartcampus/constants/lists.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SBOperations {
  final SupabaseClient supabase = Supabase.instance.client;

  // Retrieve all images for app
  Future<void> retrieveAppImagesFromSB() async {
    List<Map<String, dynamic>> list = [];
    final List<FileObject> files = await supabase.storage.from('images').list();

    for (var file in files) {
      final String publicUrl = supabase.storage
          .from('images')
          .getPublicUrl(file.name);

      list.add({Functions().removeTypeFromName(file.name, '.jpg'): publicUrl});
    }
    splashImages = list;
  }
}
