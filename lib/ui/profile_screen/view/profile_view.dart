import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:invesq/ui/login_screen/view/login_screen.dart';
import 'package:invesq/widgets/custom_button_widget.dart';

import '../../../api/repositories/user_repository/model/response_model/user_response_model/user_response_model.dart';
import '../../../utils/get_storage_utils.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  UserResponseModel? user;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  void _logout() async {
    // 1️⃣ Clear user model and access token
    await GetStorageUtils.remove(kUserResponseModel);
    await GetStorageUtils.remove(kAuthorizationToken);

    // 2️⃣ Navigate to login page and remove all previous routes
    if (mounted) {
      Get.offAllNamed(LoginScreen.route);
    }
  }

  void _loadUser() async {
    final userJsonString = await GetStorageUtils.getString(
      kUserResponseModel,
      "",
    );

    if (userJsonString != null && userJsonString.isNotEmpty) {
      final Map<String, dynamic> jsonMap = jsonDecode(userJsonString);
      if (mounted) {
        setState(() {
          user = UserResponseModel.fromJson(jsonMap);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return user == null
        ? const Center(child: Text("No user data found"))
        : Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _profileImage(user?.profileImage),
                    const SizedBox(height: 16),

                    // Name (centered)
                    Text(
                      "${user?.firstName ?? "-"} ${user?.lastName ?? "-"}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 4),

                    // Email (centered)
                    Text(
                      user!.email ?? "-",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    CustomElevatedButtonWidget(
                      child: Text("Logout"),
                      onPressed: _logout,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

Widget _profileImage(String? profileImage) {
  final imageUrl = profileImage;

  return Center(
    child: CircleAvatar(
      radius: 50,
      backgroundColor: Colors.grey.shade200,
      child: imageUrl == null || imageUrl.isEmpty
          ? const Icon(Icons.person, size: 50)
          : ClipOval(
              child: Image.network(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.person, size: 50);
                },
              ),
            ),
    ),
  );
}
