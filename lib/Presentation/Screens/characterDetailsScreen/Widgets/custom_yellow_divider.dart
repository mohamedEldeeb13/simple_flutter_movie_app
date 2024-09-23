import 'package:flutter/material.dart';
import '../../../../constant/my_colors.dart';

class CustomYellowDivider extends StatelessWidget {
  const CustomYellowDivider({super.key, required this.endPoint});
  final double endPoint;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: MyColors.myYellow,
      endIndent: endPoint,
      height: 30,
      thickness: 2,
    );
  }
}
