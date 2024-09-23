import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../BusinessLogics/Cubit/characters/characters_cubit.dart';
import '../../../../Data/Models/character.dart';
import 'characters_list_view.dart';
import 'custom_search_text_field.dart';

import '../../../../constant/my_colors.dart';

class CharactersScreenBody extends StatefulWidget {
  const CharactersScreenBody({super.key});

  @override
  State<CharactersScreenBody> createState() => _CharactersScreenBodyState();
}

class _CharactersScreenBodyState extends State<CharactersScreenBody> {
  late List<Character> allCharacters;
  List<Character> searchedCharacters = [];
  bool _isSearched = false;
  final _searchedController = TextEditingController();

  @override
  void dispose() {
    _searchedController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: _isSearched
            ? CustomSearchTextField(
                searchController: _searchedController,
                onChanged: (value) => getSearchList(value),
              )
            : const Text(
                "Characters",
                style: TextStyle(color: MyColors.myGrey),
              ),
        leading: _isSearched
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _searchedController.clear();
                    _isSearched = false;
                  });
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: MyColors.myGrey,
                ))
            : null,
        actions: createActionAppBarWidget(),
      ),
      backgroundColor: MyColors.myGrey,
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoaded) {
            allCharacters = state.characters;
            return SingleChildScrollView(
              child: Column(
                children: [
                  CharactersListView(
                    allCharacters: _searchedController.text.isEmpty
                        ? allCharacters
                        : searchedCharacters,
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: MyColors.myYellow,
                strokeWidth: 2,
              ),
            );
          }
        },
      ),
    );
  }

  List<Widget> createActionAppBarWidget() {
    return [
      _isSearched
          ? IconButton(
              onPressed: () {
                setState(() {
                  _searchedController.clear();
                  _isSearched = false;
                });
              },
              icon: const Icon(
                Icons.clear,
                color: MyColors.myGrey,
              ))
          : IconButton(
              onPressed: () {
                setState(() {
                  _isSearched = true;
                });
              },
              icon: const Icon(
                Icons.search,
                color: MyColors.myGrey,
              ))
    ];
  }

  void getSearchList(String searchedString) {
    searchedCharacters = allCharacters
        .where((e) => e.name!.toLowerCase().startsWith(searchedString))
        .toList();
    setState(() {});
  }
}
