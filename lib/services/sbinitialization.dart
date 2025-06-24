import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> sbInit() async {
  await Supabase.initialize(
    url: 'https://pzzbfivgjhljbrcnxmau.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB6emJmaXZnamhsamJyY254bWF1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA2NzA0MTksImV4cCI6MjA2NjI0NjQxOX0.lRJn3n3xxHez7CUrl8hJKMydWUKcNbXTSO1dd46PJ5I',
  );
}
