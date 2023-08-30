import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoute/qoute_app/domain/entity/qoute_entity.dart';
import 'package:qoute/qoute_app/presentation/widgets/primary_widgets/custom_text_widget.dart';

import '../../../domain/entity/favorite_entity.dart';
import '../../cubit/favorite_cubit/add_fav_cubit.dart';

class QuoteDisplayWidget extends StatefulWidget {
  final QouteEntity qoute;
  const QuoteDisplayWidget({Key? key, required this.qoute}) : super(key: key);

  @override
  State<QuoteDisplayWidget> createState() => _QuoteDisplayWidgetState();
}

class _QuoteDisplayWidgetState extends State<QuoteDisplayWidget> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OswaldTextWidget(
                  text: widget.qoute.text,
                  fontsize: 30,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 20),
                OswaldTextWidget(
                  text: '-${widget.qoute.author}',
                  fontsize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const InkWell(child: Icon(Icons.share, size: 25)),
              const SizedBox(width: 20),
              InkWell(
                onTap: () {
                  final fav = FavoriteEntity(
                      text: widget.qoute.text, author: widget.qoute.author);
                  context.read<FavCubit>().addFavorite(fav);
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
                    : const Icon(Icons.favorite_border),
              ),
            ],
          )
        ],
      ),
    );
  }
}
