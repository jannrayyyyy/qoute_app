import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoute/qoute_app/presentation/cubit/favorite_cubit/add_fav_cubit.dart';
import 'package:qoute/qoute_app/presentation/widgets/primary_widgets/custom_text_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: BlocBuilder<FavCubit, FavState>(
          builder: (context, state) {
            if (state is FavLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: state.favorites.map((e) {
                    return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            QuickSandTextWidget(
                              text: e.text,
                              fontsize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                QuickSandTextWidget(
                                  text: e.author,
                                  fontsize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                                IconButton(
                                  onPressed: () {
                                    context.read<FavCubit>().deleteFav(e.text);
                                    context.read<FavCubit>().fetchFavorite();
                                  },
                                  icon: const Icon(Icons.delete),
                                )
                              ],
                            )
                          ],
                        ));
                  }).toList(),
                ),
              );
            } else if (state is FavEmpty) {
              return const Center(
                child: QuickSandTextWidget(
                  text: 'Empty',
                  fontsize: 30,
                ),
              );
            }
            return Container(
              color: Colors.white,
            );
          },
        ));
  }
}
