import 'package:smartcampus/services/sbcredentials.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> sbInit() async {
  await Supabase.initialize(
    url: SBCredentials().projectURL,
    anonKey: SBCredentials().apikey,
  );
}
