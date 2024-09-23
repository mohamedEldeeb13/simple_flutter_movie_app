import 'package:flutter/material.dart';
import '../../../../Data/Models/character.dart';
import '../../../../constant/my_colors.dart';
import '../../../../constant/strings.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, detailsCharacterScreen,
            arguments: character),
        child: GridTile(
          footer: Hero(
            tag: character.charId ?? 0,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                "${character.name}",
                style: const TextStyle(
                    height: 1.3,
                    fontSize: 16,
                    color: MyColors.myWhite,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            color: MyColors.myWhite,
            child: character.image!.isNotEmpty
                ? FadeInImage.assetNetwork(
                    width: 50,
                    height: 50,
                    placeholder: "assets/images/loading.gif",
                    image: character.image!,
                    fit: BoxFit.fill)
                : Image.asset("assets/images/picture.png"),
          ),
        ),
      ),
    );
  }
}
