import 'package:flutter/material.dart';
import '../../../../Data/Models/character.dart';
import 'character_item.dart';

class CharactersListView extends StatelessWidget {
  const CharactersListView({super.key, required this.allCharacters});
  final List<Character> allCharacters;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allCharacters.length,
      itemBuilder: (context, index) {
        return CharacterItem(
          character: allCharacters[index],
        );
      },
    );
  }
}
