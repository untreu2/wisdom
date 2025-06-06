import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'models/note_item.dart';
import 'note_service.dart';
import 'note_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(NoteItemAdapter());

  const secureStorage = FlutterSecureStorage();
  String? encodedKey = await secureStorage.read(key: 'hive_key');

  if (encodedKey == null) {
    final newKey = Hive.generateSecureKey();
    encodedKey = base64UrlEncode(newKey);
    await secureStorage.write(key: 'hive_key', value: encodedKey);
  }

  final encryptionKey = base64Url.decode(encodedKey);

  await Hive.openBox<NoteItem>(
    NoteService.boxName,
    encryptionCipher: HiveAesCipher(encryptionKey),
  );

  final noteService = NoteService();
  await noteService.init();

  runApp(MyApp(noteService: noteService));
}

class MyApp extends StatelessWidget {
  final NoteService noteService;

  const MyApp({super.key, required this.noteService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'nospass',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: NoteListPage(noteService: noteService),
    );
  }
}
