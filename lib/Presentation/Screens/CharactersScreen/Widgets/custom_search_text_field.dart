import 'package:flutter/material.dart';
import '../../../../constant/my_colors.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField(
      {super.key, required this.searchController, this.onChanged});
  final TextEditingController searchController;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      cursorColor: MyColors.myGrey,
      decoration: const InputDecoration(
          hintText: "Find a character ....",
          border: InputBorder.none,
          hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18)),
      style: const TextStyle(color: MyColors.myGrey, fontSize: 18),
      onChanged: onChanged,
    );
  }
}
