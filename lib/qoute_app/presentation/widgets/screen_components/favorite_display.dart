import 'package:flutter/material.dart';

import '../../../domain/entity/favorite_entity.dart';
import '../primary_widgets/custom_text_widget.dart';

class FavoriteDisplay extends StatefulWidget {
  final FavoriteEntity fav;
  const FavoriteDisplay({Key? key, required this.fav}) : super(key: key);

  @override
  State<FavoriteDisplay> createState() => _FavoriteDisplayState();
}

class _FavoriteDisplayState extends State<FavoriteDisplay> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      QuickSandTextWidget(
        text: widget.fav.text,
        fontsize: 20,
        fontWeight: FontWeight.bold,
      ),
      const SizedBox(height: 15),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          QuickSandTextWidget(
            text: widget.fav.author,
            fontsize: 15,
            fontWeight: FontWeight.w800,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          )
        ],
      )
    ]);
  }
}
