import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:no/common/services/auth-service.dart';
import 'package:no/common/widgets/primary-button.dart';
import 'package:no/common/widgets/secondary-button.dart';

class RARecipesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AJPrimaryButton(
          text: 'Sign Out',
          onPressed: () async {
            var s = AuthService();
            var res = await s.signOut();
            if (res != null) {
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.pushReplacementNamed(context, "/");
            }
          },
        ),
        AJSecondaryButton(
          text: 'Set Displayname',
          onPressed: () async {
            var u = await FirebaseAuth.instance.currentUser();
            UserUpdateInfo info = new UserUpdateInfo();
            info.displayName = 'Arthur Joppart';
            await u.updateProfile(info);
            print('Updated profile');
          },
        ),
      ],
    );
  }
}