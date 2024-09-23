import '../Models/character.dart';
import '../Service/characters_service.dart';

class CharactersRepo {
  final CharactersService charactersService;

  CharactersRepo({required this.charactersService});

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersService.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
