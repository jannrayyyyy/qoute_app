import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoute/dependency.dart';
import 'package:qoute/qoute_app/presentation/cubit/favorite_cubit/add_fav_cubit.dart';
import 'package:qoute/qoute_app/presentation/cubit/qoute_cubit/qoute_cubit.dart';
import 'package:qoute/qoute_app/presentation/widgets/primary_widgets/drawer.dart';
import 'package:qoute/qoute_app/presentation/widgets/screen_components/quote_display.dart';

class NotHome extends StatefulWidget {
  const NotHome({Key? key}) : super(key: key);

  @override
  State<NotHome> createState() => _NotHomeState();
}

class _NotHomeState extends State<NotHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
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
