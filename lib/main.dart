import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';
import 'package:qoute/qoute_app/presentation/pages/mainpage.dart';
import 'qoute_app/data/model/favorite_model.dart';
import 'dependency.dart' as de;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await de.init();
  final path = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(path.path);
  Hive.registerAdapter(FavoriteModelAdapter());
  await Hive.openBox('favorite');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: MyApp.themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.amber),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: const MainPage(),
          );
        });
  }
}
