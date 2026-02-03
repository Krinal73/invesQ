import 'package:flutter/material.dart';

import 'profile_view.dart';

class ProfileScreen extends StatelessWidget {
  static const String route = '/profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileView();
  }
}
