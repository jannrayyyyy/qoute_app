import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';
import 'qoute_app/data/model/favorite_model.dart';
import 'qoute_app/presentation/pages/homepage.dart';
import 'dependency.dart' as de;
import 'dependency.dart';
import 'qoute_app/presentation/cubit/favorite_cubit/add_fav_cubit.dart';

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
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<FavCubit>(
          create: (context) => sl<FavCubit>()..fetchFavorite(),
          child: const HomePage()),
    );
  }
}
