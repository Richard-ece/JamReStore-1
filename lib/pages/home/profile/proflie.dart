import 'package:flutter/material.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/pages/home/profile/components/numbers_component.dart';
import 'package:jam_re_store/pages/home/profile/components/profile_Component.dart';
import 'package:jam_re_store/utils/user/user_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.profile),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
          ),
          AvatarUser(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          const SizedBox(height: 24),
          NumbersComponent(),
          const SizedBox(height: 48),
          buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(ProfileAccount profileAccount) => Column(
        children: [
          Text(
            profileAccount.name,
          ),
          const SizedBox(height: 4),
          Text(
            profileAccount.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildAbout(ProfileAccount profileAccount) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.about
                // style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
            const SizedBox(height: 16),
            Text(
              profileAccount.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
