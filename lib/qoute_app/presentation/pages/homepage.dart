import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/favorite_entity.dart';
import '../cubit/favorite_cubit/add_fav_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final text = TextEditingController();
  final author = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: text,
          ),
          TextField(
            controller: author,
          ),
          ElevatedButton(
            onPressed: () {
              final favorite =
                  FavoriteEntity(text: text.text, author: author.text);
              context.read<FavCubit>().addFavorite(favorite);
              context.read<FavCubit>().fetchFavorite();
            },
            child: const Text('add'),
          ),
          Expanded(
            child: BlocBuilder<FavCubit, FavState>(
              builder: (context, state) {
                if (state is FavLoaded) {
                  return Column(
                    children: state.favorites.map((e) => Text(e.text)).toList(),
                  );
                } else if (state is FavEmpty) {
                  return const Center(
                    child: Text('wala'),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
