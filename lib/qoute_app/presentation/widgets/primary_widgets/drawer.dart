import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoute/qoute_app/presentation/cubit/favorite_cubit/add_fav_cubit.dart';

import '../../../../dependency.dart';
import '../../../../main.dart';
import '../../pages/favoritepage.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool isFavOnTap = false;
  bool defaultLight = false;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(200)),
      child: Drawer(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  MyApp.themeNotifier.value =
                      MyApp.themeNotifier.value == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;

                  setState(() {
                    defaultLight = !defaultLight;
                  });
                },
                child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          MyApp.themeNotifier.value == ThemeMode.light
                              ? Icons.dark_mode_outlined
                              : Icons.dark_mode_sharp,
                        ),
                        const SizedBox(width: 10),
                        defaultLight
                            ? const Text('Light Mode')
                            : const Text('Dark Mode')
                      ],
                    )),
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      //fav
                      setState(() {
                        isFavOnTap = !isFavOnTap;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlocProvider<FavCubit>(
                                      create: (context) =>
                                          sl<FavCubit>()..fetchFavorite(),
                                      child: const FavoritePage(),
                                    )));
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        margin: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            isFavOnTap
                                ? Row(
                                    children: const [
                                      Icon(Icons.favorite,
                                          color: Colors.redAccent),
                                      SizedBox(width: 10),
                                      Text('Favorite'),
                                    ],
                                  )
                                : Row(
                                    children: const [
                                      Icon(Icons.favorite),
                                      SizedBox(width: 10),
                                      Text('Favorite'),
                                    ],
                                  )
                          ],
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
