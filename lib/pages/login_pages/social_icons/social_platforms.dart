import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/pages/home_page/home_page.dart';
import 'package:myapp/pages/login_pages/social_icons/social_snackbar.dart';
import 'package:myapp/services/auth_services.dart';


class SocialPlatforms {
  static List<Map<String, dynamic>> getPlatforms(BuildContext context) {
    return [
      {
        'icon': Icons.facebook,
        'onPressed': () {
          SocialSnackbar.show(context, 'Facebook login is not supported yet.');
        },
      },
      {
        'icon': FontAwesomeIcons.google,
        'onPressed': () async {
          try {
            final user = await AuthServices.signInWithGoogle();
            if (user != null) {
              SocialSnackbar.show(context, 'Successfully signed in with Google!');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(title: user.displayName ?? 'Home'),
                ),
              );
            } else {
              SocialSnackbar.show(context, 'Google Sign-In failed.');
            }
          } catch (e) {
            SocialSnackbar.show(context, 'Google Sign-In failed: $e');
          }
        },
      },
      {
        'icon': FontAwesomeIcons.apple,
        'onPressed': () {
          SocialSnackbar.show(context, 'Apple login is not supported yet.');
        },
      },
    ];
  }
}
