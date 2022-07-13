import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoute/qoute_app/presentation/cubit/favorite_cubit/add_fav_cubit.dart';
import 'package:qoute/qoute_app/presentation/cubit/qoute_cubit/qoute_cubit.dart';
import 'package:qoute/qoute_app/presentation/widgets/primary_widgets/custom_text_widget.dart';
import 'package:qoute/qoute_app/presentation/widgets/primary_widgets/drawer.dart';
import 'package:qoute/qoute_app/presentation/widgets/screen_components/quote_display.dart';

import '../../../dependency.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const QuickSandTextWidget(text: 'F'),
        ),
        endDrawer: const DrawerWidget(),
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
                        const SizedBox(height: 50),
                        Column(
                          children: [
                            CarouselSlider(
                                items: state.qoutes.map((e) {
                                  return Container(
                                      margin: const EdgeInsets.all(10),
                                      child: QuoteDisplayWidget(qoute: e));
                                }).toList(),
                                options: CarouselOptions(
                                  height: 600,
                                  autoPlay: true,
                                  autoPlayCurve: Curves.ease,
                                  autoPlayInterval: const Duration(seconds: 15),
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
        )
        // body: Column(
        //   children: [
        //     TextField(
        //       controller: text,
        //     ),
        //     TextField(
        //       controller: author,
        //     ),
        //     ElevatedButton(
        //       onPressed: () {
        //         final favorite =
        //             FavoriteEntity(text: text.text, author: author.text);
        //         context.read<FavCubit>().addFavorite(favorite);
        //         context.read<FavCubit>().fetchFavorite();
        //       },
        //       child: const Text('add'),
        //     ),
        //     Expanded(
        //       child: BlocBuilder<FavCubit, FavState>(
        //         builder: (context, state) {
        //           if (state is FavLoaded) {
        //             return Column(
        //               children: state.favorites.map((e) => Text(e.text)).toList(),
        //             );
        //           } else if (state is FavEmpty) {
        //             return const Center(
        //               child: Text('wala'),
        //             );
        //           }
        //           return const SizedBox.shrink();
        //         },
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
