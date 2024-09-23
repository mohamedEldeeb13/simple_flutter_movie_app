import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'Widgets/characters_screen_body.dart';
import '../../../constant/my_colors.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (BuildContext context,
          List<ConnectivityResult> connectivity, Widget child) {
        final bool connected = !connectivity.contains(ConnectivityResult.none);
        if (connected) {
          return const CharactersScreenBody();
        } else {
          return _buildNoInternetConnection();
        }
      },
      child: const CircularProgressIndicator(),
    );
  }

  Widget _buildNoInternetConnection() {
    return Center(
      child: Container(
        color: MyColors.myWhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/images/no_internet.png",
              fit: BoxFit.fill,
            ),
            const Text(
              "Can\'t connect .. check internet",
              style: TextStyle(color: MyColors.myGrey, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
