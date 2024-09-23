import 'package:flutter/material.dart';
import '../../../../constant/my_colors.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar(
      {super.key,
      required this.name,
      required this.charId,
      required this.image});
  final String name;
  final int charId;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          name,
          style: const TextStyle(
              color: MyColors.myYellow, fontWeight: FontWeight.bold),
        ),
        background: Hero(
            tag: charId,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
