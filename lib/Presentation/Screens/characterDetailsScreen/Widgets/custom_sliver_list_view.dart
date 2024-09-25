import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Data/Models/character.dart';
import 'custom_rich_text.dart';
import 'custom_yellow_divider.dart';

class CustomSliverListView extends StatelessWidget {
  const CustomSliverListView({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      Container(
        margin: const EdgeInsetsDirectional.fromSTEB(14, 14, 14, 0),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRichText(
                title: 'Job : ', value: character.location?["name"] ?? ''),
            CustomYellowDivider(endPoint: 290.w),
            CustomRichText(
                title: 'Appeared in : ',
                value: character.origin?["name"] ?? ''),
            CustomYellowDivider(
                endPoint: MediaQuery.of(context).size.width * 0.66),
            CustomRichText(
                title: 'Status : ', value: character.statusOfDeadOrAlive ?? ''),
            CustomYellowDivider(
                endPoint: MediaQuery.of(context).size.width * 0.77),
            CustomRichText(title: 'Gender : ', value: character.gender ?? ''),
            CustomYellowDivider(
                endPoint: MediaQuery.of(context).size.width * 0.76),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 400.h,
      ),
    ]));
  }
}
