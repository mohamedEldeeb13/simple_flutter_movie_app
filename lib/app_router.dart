import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'BusinessLogics/Cubit/characters/characters_cubit.dart';
import 'Data/Models/character.dart';
import 'Data/Repo/characters_repo.dart';
import 'Data/Service/characters_service.dart';
import 'Presentation/Screens/characterDetailsScreen/characters_details_screen.dart';
import 'Presentation/Screens/CharactersScreen/characters_screen.dart';
import 'constant/strings.dart';

class AppRoute {
  late CharactersRepo charactersRepo;
  late CharactersCubit charactersCubit;
  AppRoute() {
    charactersRepo = CharactersRepo(charactersService: CharactersService());
    charactersCubit = CharactersCubit(charactersRepo);
  }
  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => charactersCubit,
                  child: const CharactersScreen(),
                ));
      case detailsCharacterScreen:
        final character = setting.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => CharactersDetailsScreen(
                  character: character,
                ));
    }
    return null;
  }
}
