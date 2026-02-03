import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:invesq/ui/login_screen/view/login_screen.dart';
import 'package:invesq/ui/profile_screen/view/profile_screen.dart';

import '../ui/base_screen/view/base_screen.dart';
import '../ui/expense_screen/view/expense_screen.dart';
import '../ui/lead_screen/view/lead_screen.dart';

List<GetPage<dynamic>>? pages = [
  GetPage(name: LoginScreen.route, page: () => LoginScreen()),
  GetPage(name: ProfileScreen.route, page: () => const ProfileScreen()),
  GetPage(name: BaseScreen.route, page: () => const BaseScreen()),
  GetPage(name: LeadScreen.route, page: () => LeadScreen()),
  GetPage(name: ExpenseScreen.route, page: () => ExpenseScreen()),
];
