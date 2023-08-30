import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoute/qoute_app/presentation/cubit/favorite_cubit/add_fav_cubit.dart';
import 'package:qoute/qoute_app/presentation/cubit/qoute_cubit/qoute_cubit.dart';
import 'package:qoute/qoute_app/presentation/pages/favoritepage.dart';
import 'package:qoute/qoute_app/presentation/widgets/primary_widgets/custom_text_widget.dart';

import '../../../dependency.dart';
import '../../domain/entity/favorite_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

bool isFav = false;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const OswaldTextWidget(
            text: 'Daily Qoute',
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider<FavCubit>(
                    create: (context) => sl<FavCubit>()..fetchFavorite(),
                    child: const FavoritePage(),
                  ),
                ),
              ),
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            )
          ],
        ),
        body: BlocProvider<FavCubit>(
          create: (context) => sl<FavCubit>(),
          child: BlocProvider<QouteCubit>(
              create: (context) => sl<QouteCubit>()..getQouteState(),
              child: BlocBuilder<QouteCubit, QouteState>(
                builder: (context, state) {
                  if (state is QouteLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is QouteLoaded) {
                    return Column(
                      children: [
                        Column(
                          children: [
                            CarouselSlider(
                                items: state.qoutes.map((e) {
                                  final author =
                                      e.author.replaceAll("type.fit", "");
                                  return Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Container(
                                      margin: const EdgeInsets.all(3),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 250,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                OswaldTextWidget(
                                                  text: e.text,
                                                  fontsize: 30,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                const SizedBox(height: 20),
                                                OswaldTextWidget(
                                                  text: author.isEmpty
                                                      ? ''
                                                      : '- $author',
                                                  fontsize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const InkWell(
                                                  child: Icon(Icons.share,
                                                      size: 25)),
                                              const SizedBox(width: 20),
                                              InkWell(
                                                onTap: () {
                                                  final fav = FavoriteEntity(
                                                    text: e.text,
                                                    author: author,
                                                  );
                                                  context
                                                      .read<FavCubit>()
                                                      .addFavorite(fav);
                                                  setState(() {
                                                    isFav = !isFav;
                                                  });
                                                },
                                                child: isFav
                                                    ? const Icon(
                                                        Icons.favorite,
                                                        color: Colors.red,
                                                        size: 25,
                                                      )
                                                    : const Icon(
                                                        Icons.favorite_border),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                                options: CarouselOptions(
                                  height: 600,
                                  autoPlay: true,
                                  autoPlayCurve: Curves.ease,
                                  autoPlayInterval: const Duration(seconds: 7),
                                  viewportFraction: 1,
                                )),
                          ],
                        ),
                      ],
                    );
                  }
                  return Container(color: Colors.amber);
                },
              )),
        ));
  }
}
