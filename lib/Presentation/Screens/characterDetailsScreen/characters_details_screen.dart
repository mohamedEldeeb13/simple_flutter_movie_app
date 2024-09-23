import 'package:flutter/material.dart';
import '../../../Data/Models/character.dart';
import 'Widgets/custom_sliver_app_bar.dart';
import 'Widgets/custom_sliver_list_view.dart';
import '../../../constant/my_colors.dart';

class CharactersDetailsScreen extends StatelessWidget {
  const CharactersDetailsScreen({super.key, required this.character});
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
              name: character.name ?? '',
              charId: character.charId ?? 0,
              image: character.image ?? ''),
          CustomSliverListView(character: character)
        ],
      ),
    );
  }
}
